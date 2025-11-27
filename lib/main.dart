import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TodoPage());
  }
}

class TodoPage extends StatefulWidget {
  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> todos = [];
  // {text: "", completed: false}
  int? editIndex;

  void addOrUpdateTodo() {
    if (_controller.text.trim().isEmpty) return;

    if (editIndex == null) {
      setState(() {
        todos.add({"text": _controller.text.trim(), "completed": false});
      });
    } else {
      setState(() {
        todos[editIndex!]["text"] = _controller.text.trim();
        editIndex = null;
      });
    }

    _controller.clear();
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void startEditing(int index) {
    setState(() {
      editIndex = index;
      _controller.text = todos[index]["text"];
    });
  }

  void toggleComplete(int index) {
    setState(() {
      todos[index]["completed"] = !todos[index]["completed"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo (${todos.length})"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter todo...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addOrUpdateTodo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Text(
                    editIndex == null ? "Add" : "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(todos[index]["text"] + index.toString()),
                    direction: DismissDirection.endToStart, // swipe left
                    onDismissed: (direction) {
                      final removed = todos[index];
                      removeTodo(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Deleted "${removed["text"]}"'),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              setState(() {
                                todos.insert(index, removed);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: todos[index]["completed"],
                          onChanged: (value) {
                            toggleComplete(index);
                          },
                        ),

                        title: Text(
                          todos[index]["text"],
                          style: TextStyle(
                            decoration: todos[index]["completed"]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: todos[index]["completed"]
                                ? const Color.fromARGB(255, 41, 19, 19)
                                : Colors.black,
                          ),
                        ),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => startEditing(index),
                            ),
                            // IconButton(
                            //   icon: Icon(Icons.delete, color: Colors.red),
                            //   onPressed: () => removeTodo(index),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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

  // Speech recognition
  late SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = SpeechToText();
  }

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

  void listen() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Status: $status');
        if (status == 'done' || status == 'notListening') {
          stopListening(); // stop automatically when done
        }
      },
      onError: (error) => print('Error: $error'),
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          final text = result.recognizedWords.trim();
          if (text.isNotEmpty) {
            // Always add new todo, ignore editIndex
            setState(() {
              todos.add({"text": text, "completed": false});
              _controller.clear();
            });

            // Optional: stop listening after one task
            stopListening();
          }
        },
        listenMode: ListenMode.confirmation, // better for single phrases
      );
    }
  }

  void stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          onPressed: _isListening ? stopListening : listen,
          backgroundColor: Colors.green,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

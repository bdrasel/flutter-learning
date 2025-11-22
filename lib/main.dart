import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
    HomeActivity({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert!"),
          content: Text("Do you want to delete?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                mySnackBar("Delete Success", context);
                Navigator.pop(context);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  final List<Map<String, dynamic>> myListItem = [
  {
    "name": "Rasel",
    "age": 24,
    "roll": 220812,
    "img":
        "https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-plant-image-photo.jpg"
  },
  {
    "name": "Jony",
    "age": 26,
    "roll": 220813,
    "img":
        "https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000"
  },
  {
    "name": "Sakib",
    "age": 30,
    "roll": 220814,
    "img":
        "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg"
  },
  {
    "name": "Kalam",
    "age": 28,
    "roll": 220815,
    "img":
        "https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-plant-image-photo.jpg"
  },
  {
    "name": "Salam",
    "age": 22,
    "roll": 220816,
    "img":
        "https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000"
  },
  {
    "name": "Balam",
    "age": 27,
    "roll": 220817,
    "img":
        "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg"
  },
];


  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      padding: EdgeInsets.all(10),
      backgroundColor: Colors.amberAccent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        backgroundColor: Colors.amberAccent,
        titleSpacing: 10,
        toolbarHeight: 60,
        toolbarOpacity: 0.6,
        elevation: 40,
        actions: [
          IconButton(
            onPressed: () {
              mySnackBar('I am Cabin', context);
            },
            icon: Icon(Icons.cabin),
          ),
          IconButton(
            onPressed: () {
              mySnackBar('I am Comment', context);
            },
            icon: Icon(Icons.comment),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
        onPressed: () {
          mySnackBar('My Floating Button', context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.sos), label: 'SOS'),
        ],
        backgroundColor: Colors.amberAccent,
        onTap: (int index) {
          if (index == 0) {}
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                accountName: Text(
                  "Rasel Hossain",
                  style: TextStyle(color: Colors.amberAccent),
                ),
                accountEmail: Text(
                  "rh023896@gmail.com",
                  style: TextStyle(color: Colors.amberAccent),
                ),
                currentAccountPicture: Image.network(
                  'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                mySnackBar('Expense Category', context);
              },
            ),
            ListTile(
              title: Text("Expense Category"),
              leading: Icon(Icons.category),
              onTap: () {},
            ),
            ListTile(
              title: Text("Expense"),
              leading: Icon(Icons.exposure_neg_1_sharp),
              onTap: () {},
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                accountName: Text(
                  "Rasel Hossain",
                  style: TextStyle(color: Colors.amberAccent),
                ),
                accountEmail: Text(
                  "rh023896@gmail.com",
                  style: TextStyle(color: Colors.amberAccent),
                ),
                currentAccountPicture: Image.network(
                  'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                mySnackBar('Expense Category', context);
              },
            ),
            ListTile(
              title: Text("Expense Category"),
              leading: Icon(Icons.category),
              onTap: () {},
            ),
            ListTile(
              title: Text("Expense"),
              leading: Icon(Icons.exposure_neg_1_sharp),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  alertDialog(context);
                },
                child: Text('Click me'),
                style: buttonStyle,
              ),
              ElevatedButton(
                onPressed: () {
                  mySnackBar('Elevated Button', context);
                },
                child: Text('Elevated Button'),
              ),
            ],
          ),

           Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: myListItem.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        mySnackBar(myListItem[index]['name'], context);
                      },
                      onDoubleTap: () {
                        mySnackBar(myListItem[index]['age'].toString(), context);
                      },
                      onLongPress: () {
                        mySnackBar(myListItem[index]['roll'].toString(), context);
                      },
                      
                      child:Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 150,
                        child: Image.network(myListItem[index]['img']!, fit: BoxFit.fill)
                      )
                    );
                  },
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "First Name",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Last Name",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextButton(
              onPressed: () {},
              style: buttonStyle,
              child: Text("Submit"),
            ),
          ),

         

        ],
      ),
    );
  }
}

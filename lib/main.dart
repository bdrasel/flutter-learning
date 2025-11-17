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
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
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
      body: Row(
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
    );
  }
}

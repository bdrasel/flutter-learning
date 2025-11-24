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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.greenAccent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityPage("Activity Route Page"),
                ),
              );
            },
            child: Text("Activity Page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityPage2()),
              );
            },
            child: Text("Activity Page2"),
          ),
        ],
      ),
    );
  }
}

class ActivityPage extends StatelessWidget {
  String msg;
  ActivityPage(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(msg), backgroundColor: Colors.greenAccent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeActivity()),
              );
            },
            child: Text("Home"),
          ),
        ],
      ),
    );
  }
}

class ActivityPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity Page 2"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityPage("Coming from ActivityPage2"),
              ),
            );
          },
          child: Text("Go Activity Page"),
        ),
      ),
    );
  }
}

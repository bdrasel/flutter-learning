import 'package:flutter/material.dart';
import 'package:my_app/Fragment/Contact.dart';
import 'package:my_app/Fragment/Email.dart';
import 'package:my_app/Fragment/Home.dart';
import 'package:my_app/Fragment/SearchFragement.dart';
import 'package:my_app/Fragment/Settings.dart';
import 'package:my_app/Fragment/Sos.dart';
import 'package:my_app/Fragment/User.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          backgroundColor: Colors.greenAccent,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              Tab(icon: Icon(Icons.sos), text: 'SOS'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'User'),
              Tab(icon: Icon(Icons.email), text: 'Email'),
              Tab(icon: Icon(Icons.contact_emergency), text: 'Contact'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Home(),
            Settings(),
            Sos(),
            SearchFragement(),
            User(),
            Email(),
            Contact(),
          ],
        ),
      ),
    );
  }
}


//  appBar: AppBar(
//         title: Text("Flutter App"),
//         backgroundColor: Colors.greenAccent,
//         titleSpacing: 10,
//         toolbarHeight: 60,
//         toolbarOpacity: 0.6,
//         elevation: 40,
//       ),
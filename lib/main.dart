import 'package:flutter/material.dart';
import 'package:poopoo/config/widgets/bottom_nav.dart';
import 'pages/home.dart';
import 'pages/friends.dart';
import 'pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poopoo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  List<Widget> get pages => [
        Home(),
        Friends(),
        Profile(),
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: currentPageIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNav(
            currentPageIndex: currentPageIndex, onPageChanged: onPageChanged),
      ),
    );
  }
}

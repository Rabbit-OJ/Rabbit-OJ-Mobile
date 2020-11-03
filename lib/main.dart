import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/views/contests.dart';
import 'package:rabbit_oj_mobile/views/problems.dart';
import 'package:rabbit_oj_mobile/views/submissions.dart';
import 'package:rabbit_oj_mobile/views/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rabbit Online Judge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _pages = List();
  List<String> _titles = ["Rabbit Online Judge", "Contests", "Submissions", "User"];

  void _handleItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages..add(ProblemsView())
      ..add(ContestsView())
      ..add(SubmissionsView())
      ..add(UserView());
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Problems"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome),
                label: "Contests"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "Submissions"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "User"
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black45,
          type: BottomNavigationBarType.fixed,
          onTap: _handleItemTapped
      ),
    );
  }
}

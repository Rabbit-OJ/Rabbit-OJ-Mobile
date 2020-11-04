import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/components/display_list.dart';
import 'package:rabbit_oj_mobile/models/problem_detail.dart';

class ProblemDetailView extends StatefulWidget {
  @override
  _ProblemDetailViewState createState() => _ProblemDetailViewState();
}

class _ProblemDetailViewState extends State<ProblemDetailView> {
  ProblemDetail problemDetail =
      ProblemDetail.demo("A + B Problem", "Output the number of A + B");
  int _selectedIndex = 0;

  void _handleItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    List<Display> problemDisplayList = [
      Display("Difficulty", problemDetail.difficulty.toString()),
      Display("Time Limit", problemDetail.timeLimit.toString() + "ms"),
      Display("Space Limit", problemDetail.spaceLimit.toString() + "MB"),
      Display("Accept", problemDetail.accept.toString()),
      Display("Attempt", problemDetail.attempt.toString()),
      Display("Created", problemDetail.createdAt.toIso8601String()),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(problemDetail.subject),
        ),
        body: DisplayListComponent(display: problemDisplayList),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.assessment_outlined), label: "Problem"),
              BottomNavigationBarItem(icon: Icon(Icons.check), label: "Submit"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "Submissions"),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black45,
            type: BottomNavigationBarType.fixed,
            onTap: _handleItemTapped));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/components/display_list.dart';
import 'package:rabbit_oj_mobile/components/submission_list.dart';
import 'package:rabbit_oj_mobile/models/problem_detail.dart';
import 'package:rabbit_oj_mobile/models/submission.dart';

class ProblemDetailView extends StatefulWidget {
  @override
  _ProblemDetailViewState createState() => _ProblemDetailViewState();
}

class _ProblemDetailViewState extends State<ProblemDetailView> {
  ProblemDetail problemDetail =
      ProblemDetail.demo("A + B Problem", "Output the number of A + B");
  int _selectedIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    List<Display> problemDisplayList = [
      Display("Difficulty", problemDetail.difficulty.toString()),
      Display("Time Limit", problemDetail.timeLimit.toString() + "ms"),
      Display("Space Limit", problemDetail.spaceLimit.toString() + "MB"),
      Display("Accept", problemDetail.accept.toString()),
      Display("Attempt", problemDetail.attempt.toString()),
      Display("Created", problemDetail.createdAt.toIso8601String()),
    ];

    _pages = [
      DisplayListComponent(display: problemDisplayList),
      Text("Coming in the future."),
      SubmissionListComponent(data: [
        SubmissionLite.demo(1, "AC"),
        SubmissionLite.demo(2, "NO"),
        SubmissionLite.demo(3, "ING")
      ])
    ];
  }

  void _handleItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: Text(problemDetail.subject),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 12),
          child: _pages[_selectedIndex],
        ),
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

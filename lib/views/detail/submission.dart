import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/components/display_list.dart';
import 'package:rabbit_oj_mobile/models/submission.dart';

class SubmissionDetailView extends StatefulWidget {
  @override
  _SubmissionDetailViewState createState() => _SubmissionDetailViewState();
}

class _SubmissionDetailViewState extends State<SubmissionDetailView> {
  Submission submission = Submission.demo("AC");

  @override
  Widget build(BuildContext ctx) {
    Color appBarBackgroundColor = Colors.blueAccent;
    if (submission.judgeStatus == "AC") {
      appBarBackgroundColor = Colors.teal;
    } else if (submission.judgeStatus == "WA") {
      appBarBackgroundColor = Colors.redAccent;
    }

    List<Display> submissionDisplayList = [
      Display("Submission #", submission.sid.toString()),
      Display("Problem", submission.questionTitle.toString()),
      Display("Status", submission.judgeStatus),
      Display("Time Used", submission.timeUsed.toString() + "ms"),
      Display("Space Used", submission.spaceUsed.toString() + "MB"),
      Display("Language", submission.language),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Submission Details"),
          backgroundColor: appBarBackgroundColor,
        ),
        body: DisplayListComponent(display: submissionDisplayList));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/models/submission.dart';

class SubmissionDetailView extends StatefulWidget {
  @override
  _SubmissionDetailViewState createState() => _SubmissionDetailViewState();
}

class _SubmissionDetailViewState extends State<SubmissionDetailView> {
  Submission submission = Submission.demo("AC");

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Submission Details"),
        ),
        body: Text("TBD"));
  }
}

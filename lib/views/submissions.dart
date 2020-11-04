import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/components/submission_list.dart';
import 'package:rabbit_oj_mobile/models/submission.dart';

class SubmissionsView extends StatefulWidget {
  @override
  _SubmissionsViewState createState() => _SubmissionsViewState();
}

class _SubmissionsViewState extends State<SubmissionsView> {
  List<SubmissionLite> _data;

  @override
  void initState() {
    _data = [
      SubmissionLite.demo(1, "AC"),
      SubmissionLite.demo(2, "NO"),
      SubmissionLite.demo(3, "ING")
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SubmissionListComponent(data: _data);
  }
}

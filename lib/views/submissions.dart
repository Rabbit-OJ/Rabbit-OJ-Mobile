import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/models/submission.dart';

class SubmissionsView extends StatefulWidget {
  @override
  _SubmissionsViewState createState() => _SubmissionsViewState();
}

class _SubmissionViewTag {
  String status;
  Color color;

  _SubmissionViewTag(this.status, this.color);
}

class _SubmissionsViewState extends State<SubmissionsView> {
  static List<_SubmissionViewTag> tag = [
    _SubmissionViewTag("Accepted", Colors.greenAccent),
    _SubmissionViewTag("Doing", Colors.blueAccent),
    _SubmissionViewTag("Failed", Colors.redAccent),
  ];
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

  _SubmissionViewTag _getViewTag(SubmissionLite submission) {
    if (submission.status == "AC") {
      return tag[0];
    } else if (submission.status == "ING") {
      return tag[1];
    } else {
      return tag[2];
    }
  }

  Widget _listBuilder(BuildContext ctx, int index) {
    if (index >= _data.length) return null;
    SubmissionLite submission = _data[index];
    _SubmissionViewTag tagInfo = _getViewTag(submission);

    return SafeArea(
        top: false,
        bottom: false,
        child: Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: InkWell(
                onTap:
                    defaultTargetPlatform == TargetPlatform.iOS ? null : () {},
                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(submission.questionTitle),
                        Padding(padding: EdgeInsets.only(left: 16.0)),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(tagInfo.status,
                                    style: TextStyle(color: tagInfo.color))
                              ]),
                        )
                      ],
                    )))));
  }

  @override
  Widget build(BuildContext ctx) {
    return ListView.builder(
      itemBuilder: _listBuilder,
    );
  }
}

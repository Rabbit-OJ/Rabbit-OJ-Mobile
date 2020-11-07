import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/models/submission.dart';
import 'package:rabbit_oj_mobile/views/detail/submission.dart';

class _SubmissionViewTag {
  String status;
  Color color;

  _SubmissionViewTag(this.status, this.color);
}

class SubmissionListComponent extends StatelessWidget {
  final List<SubmissionLite> data;

  SubmissionListComponent({Key key, this.data = const <SubmissionLite>[]})
      : super(key: key);

  static List<_SubmissionViewTag> tag = [
    _SubmissionViewTag("Accepted", Colors.greenAccent),
    _SubmissionViewTag("Doing", Colors.blueAccent),
    _SubmissionViewTag("Failed", Colors.redAccent),
  ];

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
    if (index >= data.length) return null;
    SubmissionLite submission = data[index];
    _SubmissionViewTag tagInfo = _getViewTag(submission);

    return SafeArea(
        top: false,
        bottom: false,
        child: Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      ctx,
                      CupertinoPageRoute(
                          title: "Submission Detail",
                          builder: (context) => SubmissionDetailView()));
                },
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

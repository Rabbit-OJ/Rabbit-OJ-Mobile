import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/models/contest.dart';

class ContestsView extends StatefulWidget {
  @override
  _ContestsViewState createState() => _ContestsViewState();
}

class _ContestViewTag {
  String status;
  Color color;

  _ContestViewTag(this.status, this.color);
}

class _ContestsViewState extends State<ContestsView> {
  static List<_ContestViewTag> tag = [
    _ContestViewTag("Coming", Colors.greenAccent),
    _ContestViewTag("Doing", Colors.deepOrangeAccent),
    _ContestViewTag("Finished", Colors.blueAccent),
  ];
  List<Contest> _data;

  @override
  void initState() {
    _data = [
      Contest.demo(1, "Div 1", 1),
      Contest.demo(2, "Div 2", 2),
      Contest.demo(3, "Div 3", 3)
    ];
    super.initState();
  }

  Widget _listBuilder(BuildContext ctx, int index) {
    if (index >= _data.length) return null;
    Contest contest = _data[index];
    _ContestViewTag tagInfo = tag[contest.status - 1];

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
                        Text(contest.name),
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

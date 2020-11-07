import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/models/problem_item.dart';
import 'package:rabbit_oj_mobile/views/detail/problem.dart';

class ProblemsView extends StatefulWidget {
  @override
  _ProblemViewState createState() => _ProblemViewState();
}

class _ProblemViewTag {
  String difficulty;
  Color color;

  _ProblemViewTag(this.difficulty, this.color);
}

class _ProblemViewState extends State<ProblemsView> {
  static List<_ProblemViewTag> tag = [
    _ProblemViewTag("Easy", Colors.greenAccent),
    _ProblemViewTag("Medium", Colors.deepOrangeAccent),
    _ProblemViewTag("Hard", Colors.redAccent),
  ];

  List<ProblemItem> _data;

  Future<List<ProblemItem>> getList(int page) async {
    Response response = await Dio().get("");
  }

  @override
  void initState() {
    _data = [
      ProblemItem.demo(1, 1),
      ProblemItem.demo(2, 2),
      ProblemItem.demo(3, 3)
    ];
    super.initState();
  }

  Widget _listBuilder(BuildContext ctx, int index) {
    if (index >= _data.length) return null;
    ProblemItem problem = _data[index];
    _ProblemViewTag tagInfo = tag[problem.difficulty - 1];

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
                          title: "Problem Details",
                          builder: (context) => ProblemDetailView()));
                },
                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(problem.subject),
                        Padding(padding: EdgeInsets.only(left: 16.0)),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(tagInfo.difficulty,
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

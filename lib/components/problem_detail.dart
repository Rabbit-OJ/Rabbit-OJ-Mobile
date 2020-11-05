import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbit_oj_mobile/models/problem_detail.dart';

import 'display_list.dart';
import 'katex_render.dart';

class ProblemDetailComponent extends StatelessWidget {
  final ProblemDetail problemDetail;

  const ProblemDetailComponent({Key key, this.problemDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Display> problemDisplayList = [
      Display("Difficulty", problemDetail.difficulty.toString()),
      Display("Time Limit", problemDetail.timeLimit.toString() + "ms"),
      Display("Space Limit", problemDetail.spaceLimit.toString() + "MB"),
      Display("Accept", problemDetail.accept.toString()),
      Display("Attempt", problemDetail.attempt.toString()),
      Display("Created", problemDetail.createdAt.toIso8601String()),
    ];

    return Scaffold(
        body: Column(
            children: [
          Expanded(child: DisplayListComponent(display: problemDisplayList)),
          Expanded(child: TeXViewMarkdownView(data: problemDetail.content))
        ]));
  }
}

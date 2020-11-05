import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class TeXViewMarkdownView extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;
  final String data;

  TeXViewMarkdownView(
      {this.renderingEngine = const TeXViewRenderingEngine.mathjax(),
      this.data = ""});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ScrollPhysics(),
      children: <Widget>[
        TeXView(
            renderingEngine: renderingEngine,
            child: TeXViewMarkdown(data),
            style: TeXViewStyle(
              margin: TeXViewMargin.all(2),
              padding: TeXViewPadding.all(2),
              backgroundColor: Colors.white,
            ),
            loadingWidgetBuilder: (context) => Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text("Rendering...")
                    ],
                  ),
                )),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

class Display {
  String key;
  String value;

  Display(this.key, this.value);
}

class DisplayListComponent extends StatelessWidget {
  const DisplayListComponent({
    Key key,
    this.display = const <Display>[],
  }) : super(key: key);

  final List<Display> display;

  Widget _listBuilder(BuildContext ctx, int index) {
    if (index >= display.length) return null;

    Display item = display[index];
    return Padding(
      padding: EdgeInsets.all(6),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Text(
              item.key,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            flex: 1,
          ),
          Expanded(
            child: Text(item.value),
            flex: 2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: _listBuilder,
    );
  }
}

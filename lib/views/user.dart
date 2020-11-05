import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return ListView(children: <Widget>[
      ListTile(
        leading: Icon(Icons.login),
        title: Text("Login"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.add_rounded),
        title: Text("Register"),
        onTap: () {},
      ),
    ]);
  }
}

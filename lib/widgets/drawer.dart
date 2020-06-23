import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DrawerUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.cyan,Colors.cyan[600]])
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.person)
                ),
                Divider(color: Colors.black,),
                Container(
                  child: ListTile(
                    leading: Text("XP:"),
                    trailing: Text("50/100XP"),
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

}
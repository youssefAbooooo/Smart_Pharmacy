import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          // ListTile(
          //   title: Text("Item 1"),
          //   onTap: () {
          //     // Handle item 1 tap
          //   },
          // ),
          // ListTile(
          //   title: Text("Item 2"),
          //   onTap: () {
          //     // Handle item 2 tap
          //   },
          // ),
          // Add more items as needed
        ],
      ),
    );
  }
}

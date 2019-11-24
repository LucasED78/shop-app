import 'package:flutter/material.dart';

class DrawerHeader extends StatelessWidget {

  final String title;
  final IconData icon;

  DrawerHeader({
    @required this.title,
    @required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 100,
      child: ListTile(
        leading: Icon(Icons.account_circle, color: Theme.of(context).accentColor,),
        title: Text(title),
        trailing: Icon(icon, color: Theme.of(context).accentColor,),
      ),
    );
  }
}

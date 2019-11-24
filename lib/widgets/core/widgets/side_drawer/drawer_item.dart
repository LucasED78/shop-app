import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function onTap;

  DrawerItem({
    @required this.title,
    @required this.icon,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).accentColor,),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

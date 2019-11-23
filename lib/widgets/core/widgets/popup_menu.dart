import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {

  final List<PopupMenuItem> items;
  final Function onSelected;

  PopupMenu({
    @required this.items,
    @required this.onSelected
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_horiz),
      itemBuilder: (_){
        return items;
      },
      onSelected: onSelected,
    );
  }
}

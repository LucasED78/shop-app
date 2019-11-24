import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {

  final String content;

  NoItems(this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Center(child: Icon(Icons.error_outline, size: 80,),),
          Text(content, style: Theme.of(context).textTheme.title,)
        ],
      ),
    );
  }
}

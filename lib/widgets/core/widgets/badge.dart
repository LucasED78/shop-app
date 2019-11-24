import 'package:flutter/material.dart';

class Badge extends StatelessWidget {

  final String value;
  final Widget child;
  final Color color;

  Badge({
    @required this.value,
    @required this.child,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned(
          left: 25,
          child: Container(
            width: 20,
            height: 20,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(50)
            ),
          ),
        ),
      ],
    );
  }
}

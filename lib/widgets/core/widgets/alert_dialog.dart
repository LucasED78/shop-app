import 'package:flutter/material.dart';

class ConfirmAlertDialog extends StatelessWidget {

  final BuildContext context;
  final String title;
  final String content;
  final Function onYesConfirm;
  final Function onNoConfirm;

  ConfirmAlertDialog({
    @required this.context,
    @required this.title,
    @required this.content,
    this.onYesConfirm,
    this.onNoConfirm
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text("Yes"),
          onPressed: (){
            onYesConfirm != null ? onYesConfirm() : Navigator.of(this.context).pop(true);
          },
        ),
        FlatButton(
          child: Text("No"),
          onPressed: (){
            onNoConfirm != null ? onNoConfirm : Navigator.of(this.context).pop(false);
          },
        )
      ],
    );
  }
}

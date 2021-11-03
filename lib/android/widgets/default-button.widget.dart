import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const DefaultButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => { onPressed() },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder()
      ),
    );
  }
}

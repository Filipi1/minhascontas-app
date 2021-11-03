import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true
    );
  }
}

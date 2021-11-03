import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minhascontas/styles/colors.theme.dart';

class HorizontalSquareMenu extends StatelessWidget {
  const HorizontalSquareMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            return SquareMenuEntity();
          }
      ),
    );
  }
}

class SquareMenuEntity extends StatelessWidget {
  const SquareMenuEntity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppThemeColors.darkColor),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo),
            SizedBox(height: 5),
            Text("Página Inicial", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

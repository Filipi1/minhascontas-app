import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minhascontas/android/widgets/default-button.widget.dart';
import 'package:minhascontas/styles/colors.theme.dart';

class NoContent extends StatelessWidget {
  const NoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.exclamationCircle, size: 50, color: AppThemeColors.primaryColor),
        SizedBox(height: 15),
        Text(
          "Oops! Desculpe",
          style: TextStyle(
            fontSize: 20,
            color: AppThemeColors.primaryColor.withAlpha(210),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Não foi encontrado nenhum registro para essa solicitação.",
          style: TextStyle(
            fontSize: 16,
            color: AppThemeColors.primaryColor.withAlpha(120),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 25),
        DefaultButton(onPressed: () => {}, text: "Tentar Novamente")
      ],
    );
  }
}

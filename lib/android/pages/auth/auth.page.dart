import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:minhascontas/android/pages/home/home.controller.dart';
import 'package:minhascontas/android/widgets/default-button.widget.dart';
import 'package:minhascontas/models/authenticated-user.model.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  TextEditingController _userInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FlutterSmartDialog(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: _userInputController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          icon: Icon(FontAwesomeIcons.user),
                          labelText: "Usuário",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            icon: Icon(FontAwesomeIcons.key),
                            labelText: "Senha",
                            border: OutlineInputBorder()),
                        obscureText: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: DefaultButton(
                        onPressed: () {
                          SmartDialog.showLoading(msg: "Aguarde");
                          Future.delayed(Duration(seconds: 2)).then((value) {
                            SmartDialog.dismiss();

                            AuthenticatedUserModel authUserModel =
                            AuthenticatedUserModel(
                              userId: 1,
                              token: "TxASdanNdakn53KJNJKnda&MDna@349dne",
                              expiresIn: 3600,
                              username: _userInputController.text,
                            );
                            _homeController.setAuthenticatedUser(authUserModel);

                            Get.offNamed("/root");
                          });
                        },
                        text: "Entrar"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

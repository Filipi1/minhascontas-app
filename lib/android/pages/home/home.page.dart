import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhascontas/android/pages/home/home.controller.dart';
import 'package:minhascontas/styles/colors.theme.dart';
import 'package:minhascontas/widgets/horizontal_square_menu.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    void updateAge() {
      // homeController.setAuthenticatedUser(); // will save to box
    }

    void logout() {
      homeController.logoutUser(); // will save to box
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Container(
          child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 180,
            decoration: BoxDecoration(color: AppThemeColors.primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Prévia de Gastos",
                    style: Theme.of(context).primaryTextTheme.bodyText1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "R\$ 300,00",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppThemeColors.whiteColor),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 15),
                        Text("/ mês",
                            style:
                                Theme.of(context).primaryTextTheme.bodyText1),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 130,
            width: double.maxFinite,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => PaymentEntity(),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 10),
              itemCount: 3,
            ),
          ),
          SizedBox(height: 15),
        ],
      )),
    );
  }
}

class PaymentEntity extends StatelessWidget {
  const PaymentEntity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: AppThemeColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.deepPurple.withAlpha(25),
                offset: Offset.zero,
                blurRadius: 10)
          ]),
      width: 210,
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent, shape: BoxShape.circle),
              ),
              SizedBox(width: 10),
              Text(
                "Em aberto",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "R\$ ",
                      style: TextStyle(
                          color: AppThemeColors.paidStatusColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 22),
                    ),
                    TextSpan(
                      text: "1.685,45",
                      style: TextStyle(
                          color: AppThemeColors.whiteColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 22),
                    )
                  ]),
                ),
                Text("Conta de Luz",
                    style: TextStyle(
                        color: AppThemeColors.whiteColor,
                        fontWeight: FontWeight.bold)),
                Text("27/08/2021",
                    style: TextStyle(color: AppThemeColors.whiteColor))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

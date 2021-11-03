import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhascontas/android/pages/payments/payments.controller.dart';
import 'package:minhascontas/models/payment.model.dart';
import 'package:minhascontas/widgets/payment-displayer.widget.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentStateController _paymentState = Get.find<PaymentStateController>();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          title: Text(
            "Contas",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          elevation: 0,
          centerTitle: true),
      body: RefreshIndicator(
        onRefresh: () async {
          List<PaymentModel> payments = [];
          payments.add(new PaymentModel(title: "Conta de Luz", price: 10));
          _paymentState.updatePayments(payments);
        },
        child: Obx(
            () => ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20),
            separatorBuilder: (_, index) {
              return SizedBox(height: 10);
            },
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PaymentDisplayer(),
              );
            },
            itemCount: _paymentState.payments.length,
          ),
        ),
      ),
    );
  }
}

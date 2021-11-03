import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:minhascontas/models/payment.model.dart';
import 'package:minhascontas/services/payments.service.dart';

class PaymentStateController extends GetxController {
  RxList<PaymentModel> payments = <PaymentModel>[].obs;

  void updatePayments(List<PaymentModel> paymentsList) {
    payments.addAll(paymentsList);
    update();
  }
}

class PaymentController {
  static Future getAllPayments() async {
    Response response = await PaymentService.getPayments();
  }
}
import 'package:dio/dio.dart';
import 'package:minhascontas/services/http-manager.service.dart';

class PaymentService {
  static Future getPayments() async {
    try {
      Response response = await HTTPManager.getMethod('/61658690/json');
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
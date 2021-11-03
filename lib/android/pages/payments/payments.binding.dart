import 'package:get/get.dart';
import 'package:minhascontas/android/pages/payments/payments.controller.dart';
import 'package:minhascontas/storage/authenticated-user.storage.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticatedUserStorage>(AuthenticatedUserStorage());
    Get.put<PaymentStateController>(PaymentStateController());
  }
}
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:minhascontas/models/authenticated-user.model.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  int? get id => box.read("id");
  String? get username => box.read("username") ?? "";
  String? get token => box.read("token") ?? "";

  void setAuthenticatedUser(AuthenticatedUserModel authenticatedUserModel) {
    box.write("id", authenticatedUserModel.userId);
    box.write("username", authenticatedUserModel.username);
    box.write("token", authenticatedUserModel.token);
    update();
  }

  void logoutUser() {
    box.write("id", null);
    box.write("username", null);
    box.write("token", null);
    update();
  }
}
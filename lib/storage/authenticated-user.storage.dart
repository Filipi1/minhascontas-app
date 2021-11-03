import 'package:get_storage/get_storage.dart';

class AuthenticatedUserStorage {
  final id = ReadWriteValue('id', 0);
  final username = ReadWriteValue('username', "ee");
  final token = ReadWriteValue('token', "e");
}
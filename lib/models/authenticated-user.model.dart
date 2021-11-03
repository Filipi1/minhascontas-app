import 'package:json_annotation/json_annotation.dart';

part 'authenticated-user.model.g.dart';

@JsonSerializable()
class AuthenticatedUserModel {
  final int userId;
  final String token;
  final int expiresIn;
  final String username;
  AuthenticatedUserModel({required this.userId, required this.token, required this.expiresIn, required this.username});
  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) => _$AuthenticatedUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticatedUserModelToJson(this);
}
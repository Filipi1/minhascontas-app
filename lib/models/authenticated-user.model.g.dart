// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated-user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedUserModel _$AuthenticatedUserModelFromJson(
        Map<String, dynamic> json) =>
    AuthenticatedUserModel(
      userId: json['userId'] as int,
      token: json['token'] as String,
      expiresIn: json['expiresIn'] as int,
      username: json['username'] as String,
    );

Map<String, dynamic> _$AuthenticatedUserModelToJson(
        AuthenticatedUserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'expiresIn': instance.expiresIn,
      'username': instance.username,
    };

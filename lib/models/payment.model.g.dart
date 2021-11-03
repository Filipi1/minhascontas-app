// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

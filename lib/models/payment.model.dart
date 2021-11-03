import 'package:json_annotation/json_annotation.dart';

part 'payment.model.g.dart';

@JsonSerializable()
class PaymentModel {
  final String title;
  final double price;
  final DateTime? createdAt;
  PaymentModel({required this.title, required this.price, this.createdAt});
  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
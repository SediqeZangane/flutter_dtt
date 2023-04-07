import 'package:json_annotation/json_annotation.dart';

part 'house_model.g.dart';

@JsonSerializable()
class HouseModel {
  final int id;
  final String image;
  final int price;
  final int bedrooms;
  final int bathrooms;
  final int size;
  final String description;
  final String zip;
  final String city;
  final double latitude;
  final double longitude;
  final String createdDate;

  HouseModel(
    this.id,
    this.image,
    this.price,
    this.bedrooms,
    this.bathrooms,
    this.size,
    this.description,
    this.zip,
    this.city,
    this.latitude,
    this.longitude,
    this.createdDate,
  );

  factory HouseModel.fromJson(Map<String, dynamic> json) =>
      _$HouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HouseModelToJson(this);
}

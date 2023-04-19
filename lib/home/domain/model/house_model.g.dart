// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => HouseModel(
      json['id'] as int,
      json['image'] as String,
      json['price'] as int,
      json['bedrooms'] as int,
      json['bathrooms'] as int,
      json['size'] as int,
      json['description'] as String,
      json['zip'] as String,
      json['city'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      json['createdDate'] as String,
    )..distance = (json['distance'] as num).toDouble();

Map<String, dynamic> _$HouseModelToJson(HouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'price': instance.price,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'size': instance.size,
      'description': instance.description,
      'zip': instance.zip,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdDate': instance.createdDate,
      'distance': instance.distance,
    };

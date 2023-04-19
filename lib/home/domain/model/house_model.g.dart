// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => HouseModel(
      id: json['id'] as int,
      image: json['image'] as String,
      price: json['price'] as int,
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      size: json['size'] as int,
      description: json['description'] as String,
      zip: json['zip'] as String,
      city: json['city'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      createdDate: json['createdDate'] as String,
    );

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
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAround _$GetAroundFromJson(Map<String, dynamic> json) {
  return GetAround(
    json['name'] as String?,
    json['uzaklik'],
    json['bio'] as String?,
    json['photo'] as String?,
    json['gender'] as String?,
    json['follows'] as String?,
    json['followers'] as String?,
  );
}

Map<String, dynamic> _$GetAroundToJson(GetAround instance) => <String, dynamic>{
      'name': instance.name,
      'uzaklik': instance.uzaklik,
      'bio': instance.bio,
      'photo': instance.photo,
      'gender': instance.gender,
      'follows': instance.follows,
      'followers': instance.followers,
    };

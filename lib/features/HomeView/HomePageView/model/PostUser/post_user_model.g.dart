// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostProfileInformations _$PostProfileInformationsFromJson(
    Map<String, dynamic> json) {
  return PostProfileInformations(
    name: json['name'] as String?,
    photo: json['photo'] as String?,
    bio: json['bio'] as String?,
    lat: json['lat'] as String?,
    lon: json['lon'] as String?,
    gender: json['gender'] as String?,
    follows: json['follows'] as String?,
    followers: json['followers'] as String?,
  );
}

Map<String, dynamic> _$PostProfileInformationsToJson(
        PostProfileInformations instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
      'bio': instance.bio,
      'lat': instance.lat,
      'lon': instance.lon,
      'gender': instance.gender,
      'follows': instance.follows,
      'followers': instance.followers,
    };

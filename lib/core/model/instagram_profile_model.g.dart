// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instagram_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstagramProfileInfoModel _$InstagramProfileInfoModelFromJson(
    Map<String, dynamic> json) {
  return InstagramProfileInfoModel(
    graphql: json['graphql'] == null
        ? null
        : Graphql.fromJson(json['graphql'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InstagramProfileInfoModelToJson(
        InstagramProfileInfoModel instance) =>
    <String, dynamic>{
      'graphql': instance.graphql,
    };

Graphql _$GraphqlFromJson(Map<String, dynamic> json) {
  return Graphql(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GraphqlToJson(Graphql instance) => <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    biography: json['biography'] as String?,
    edge_followed_by: json['edge_followed_by'] == null
        ? null
        : EdgeFollowedBy.fromJson(
            json['edge_followed_by'] as Map<String, dynamic>),
    edge_follow: json['edge_follow'] == null
        ? null
        : EdgeFollowedBy.fromJson(json['edge_follow'] as Map<String, dynamic>),
    profile_pic_url_hd: json['profile_pic_url_hd'] as String?,
    username: json['username'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'biography': instance.biography,
      'edge_followed_by': instance.edge_followed_by,
      'edge_follow': instance.edge_follow,
      'profile_pic_url_hd': instance.profile_pic_url_hd,
      'username': instance.username,
    };

EdgeFollowedBy _$EdgeFollowedByFromJson(Map<String, dynamic> json) {
  return EdgeFollowedBy(
    count: json['count'] as int?,
  );
}

Map<String, dynamic> _$EdgeFollowedByToJson(EdgeFollowedBy instance) =>
    <String, dynamic>{
      'count': instance.count,
    };

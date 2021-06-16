import 'package:json_annotation/json_annotation.dart';

part 'instagram_profile_model.g.dart';

@JsonSerializable()
class InstagramProfileInfoModel {
  Graphql? graphql;

  InstagramProfileInfoModel({this.graphql});

  factory InstagramProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return _$InstagramProfileInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InstagramProfileInfoModelToJson(this);
  }
}

@JsonSerializable()
class Graphql {
  User? user;

  Graphql({this.user});

  factory Graphql.fromJson(Map<String, dynamic> json) {
    return _$GraphqlFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GraphqlToJson(this);
  }
}

@JsonSerializable()
class User {
  String? biography;
  EdgeFollowedBy? edge_followed_by;
  EdgeFollowedBy? edge_follow;
  String? profile_pic_url_hd;
  String? username;

  User({
    this.biography,
    this.edge_followed_by,
    this.edge_follow,
    this.profile_pic_url_hd,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class EdgeFollowedBy {
  int? count;

  EdgeFollowedBy({this.count});

  factory EdgeFollowedBy.fromJson(Map<String, dynamic> json) {
    return _$EdgeFollowedByFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EdgeFollowedByToJson(this);
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'post_user_model.g.dart';

@JsonSerializable()
class PostProfileInformations {
  String? name;
  String? photo;
  String? bio;
  String? lat;
  String? lon;
  String? gender;
  String? follows;
  String? followers;

  PostProfileInformations({
    required this.name,
    required this.photo,
    required this.bio,
    required this.lat,
    required this.lon,
    required this.gender,
    required this.follows,
    required this.followers,
  });

  factory PostProfileInformations.fromJson(Map<String, dynamic> json) =>
      _$PostProfileInformationsFromJson(json);

  Map<String, dynamic> toJson() {
    return _$PostProfileInformationsToJson(this);
  }
}

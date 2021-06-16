import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_page_model.g.dart';

@JsonSerializable()
class GetAround extends INetworkModel {
  String? name;
  var uzaklik;
  String? bio;
  String? photo;
  String? gender;
  String? follows;
  String? followers;

  GetAround(
    this.name,
    this.uzaklik,
    this.bio,
    this.photo,
    this.gender,
    this.follows,
    this.followers,
  );

  factory GetAround.fromJson(Map<String, dynamic> json) =>
      _$GetAroundFromJson(json);
  @override
  Map<String, dynamic> toJson() {
    return _$GetAroundToJson(this);
  }

  @override
  GetAround fromJson(Map<String, dynamic> json) {
    return GetAround.fromJson(json);
  }
}

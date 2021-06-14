import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'house_model.g.dart';

@JsonSerializable()
class HouseModel extends INetworkModel<HouseModel> {
  @JsonKey(name: "_id")
  String? id;
  String? title;
  String? description;
  String? image;
  UserHouse? user;
  int? iV;

  HouseModel(
      {this.id, this.user, this.title, this.description, this.image, this.iV});

  @override
  HouseModel fromJson(Map<String, Object?> json) {
    return _$HouseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$HouseModelToJson(this);
  }
}

@JsonSerializable()
class UserHouse extends INetworkModel<UserHouse> {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? date;
  String? image;

  UserHouse({this.id, this.name, this.date, this.image});

  @override
  UserHouse fromJson(Map<String, Object?> json) {
    return _$UserHouseFromJson(json);
  }

  @override
  factory UserHouse.fromJson(Map<String, Object?> json) {
    return _$UserHouseFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$UserHouseToJson(this);
  }
}

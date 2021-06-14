import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUser extends INetworkModel<SocialUser> {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? company;
  String? image;

  SocialUser({this.id, this.name, this.company, this.image});

  @override
  SocialUser fromJson(Map<String, dynamic> json) {
    return _$SocialUserFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SocialUserToJson(this);
  }

  SocialUser.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    name = json['name'] as String?;
    company = json['company'] as String?;
    image = json['image'] as String?;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SocialUser &&
        o.id == id &&
        o.name == name &&
        o.company == company &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ company.hashCode ^ image.hashCode;
  }
}

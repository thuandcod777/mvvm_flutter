// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialUser _$SocialUserFromJson(Map<String, dynamic> json) {
  return SocialUser(
    id: json['sId'] as String?,
    name: json['name'] as String?,
    company: json['company'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$SocialUserToJson(SocialUser instance) =>
    <String, dynamic>{
      'sId': instance.id,
      'name': instance.name,
      'company': instance.company,
      'image': instance.image,
    };

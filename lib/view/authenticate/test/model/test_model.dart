import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_flutter/core/base/model/base_model.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends BaseModel {
  int? userId;
  int? id;
  String? title;
  bool? comleted;

  TestModel({this.userId, this.id, this.title, this.comleted});
  @override
  Map<String, dynamic> toJson() => _$TestModelToJson(this);

  @override
  fromJson(Map<String, Object> json) => _$TestModelFromJson(json);
}

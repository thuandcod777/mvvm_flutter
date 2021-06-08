import 'package:mvvm_flutter/core/base/model/base_model.dart';

class PostModel extends BaseModel<PostModel> {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? description;
  String? imagePath;

  PostModel(
      {this.userId,
      this.id,
      this.title,
      this.body,
      this.imagePath,
      this.description});

  @override
  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int?;
    id = json['id'] as int?;
    title = json['title'] as String?;
    body = json['body'] as String?;
    imagePath = json['imagePath'] as String?;
    description = json['description'] as String?;
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId!;
    data['id'] = id!;
    data['title'] = title!;
    data['body'] = body!;
    data['imagePath'] = imagePath!;
    data['description'] = description!;
    return data;
  }

  @override
  PostModel fromJson(Map<String, dynamic> json) {
    return PostModel.fromJson(json);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LessonModel {
  final String unitDesc;
  final String reflections;
  LessonModel({
    required this.reflections,
    required this.unitDesc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'unitDesc': unitDesc,
      'reflections': reflections,
    };
  }

  factory LessonModel.fromMap(Map<dynamic, dynamic> map) {
    return LessonModel(
      unitDesc: map['unitDesc'] as String,
      reflections: map['reflections'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonModel.fromJson(String source) =>
      LessonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

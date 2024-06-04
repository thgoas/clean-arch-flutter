// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fin_ca/layers/domain/entities/group_entity.dart';

class GroupDto extends GroupEntity {
  final String id;
  final String description;
  final String type;

  GroupDto({required this.id, required this.description, required this.type})
      : super(description: description, id: id, type: type);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'type': type,
    };
  }

  factory GroupDto.fromMap(Map<String, dynamic> map) {
    return GroupDto(
      id: map['id'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupDto.fromJson(String source) =>
      GroupDto.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return toJson().toString();
  }
}

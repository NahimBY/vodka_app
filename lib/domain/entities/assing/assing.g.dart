// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assign _$AssignFromJson(Map<String, dynamic> json) => Assign(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  teamId: (json['team_id'] as num).toInt(),
);

Map<String, dynamic> _$AssignToJson(Assign instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'team_id': instance.teamId,
};

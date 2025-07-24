import 'package:json_annotation/json_annotation.dart';

part 'assing.g.dart';

@JsonSerializable()
class Assign {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'team_id')
  final int teamId;

  Assign({required this.id, required this.userId, required this.teamId});

  factory Assign.fromJson(Map<String, dynamic> json) => _$AssignFromJson(json);
  Map<String, dynamic> toJson() => _$AssignToJson(this);
}

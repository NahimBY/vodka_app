import 'package:json_annotation/json_annotation.dart';

part 'tournament_response.g.dart';

@JsonSerializable()
class TournamentResponse {
  final int id;
  final String name;
  final String? emblem;
  final int? status;

  TournamentResponse({
    required this.id,
    required this.name,
    this.emblem,
    this.status,
  });

  factory TournamentResponse.fromJson(Map<String, dynamic> json) =>
      _$TournamentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentResponseToJson(this);
}

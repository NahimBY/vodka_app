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
      TournamentResponse(
        id: json["id"],
        name: json["name"],
        emblem: json["emblem"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "emblem": emblem,
    "status": status,
  };
}

class Assign {
  final int id;
  final int userId;
  final int teamId;

  Assign({
    required this.id,
    required this.userId,
    required this.teamId,
  });

  factory Assign.fromJson(Map<String, dynamic> json) {
    return Assign(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      teamId: json['team_id'] as int,
    );
  }
}
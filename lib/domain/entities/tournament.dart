class Tournament {
  final int id;
  final String name;
  final String? emblem;
  final int? status;

  Tournament({required this.id, required this.name, this.emblem, this.status});

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      id: json['id'] as int,
      name: json['name'] as String,
      emblem: json['emblem'] as String,
      status: json['status'] as int,
    );
  }
}

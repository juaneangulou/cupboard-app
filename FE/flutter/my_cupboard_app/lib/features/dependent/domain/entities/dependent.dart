class Dependent {
  final int id;
  final String name;
  final String dateOfBirth;
  final int userId;

  Dependent({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.userId,
  });

  factory Dependent.fromJson(Map<String, dynamic> json) {
    return Dependent(
      id: json['id'],
      name: json['name'],
      dateOfBirth: json['dateOfBirth'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'userId': userId,
    };
  }
}
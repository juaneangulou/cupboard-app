class User {
  final String id;
  final String email;
  final String? firstName;
  final String? secondName;
  final String? firstLastName;
  final String? secondLastName;
  final List<String>? roles;
  final String? token;

  User({
    required this.id,
    required this.email,
    this.firstName,
    this.secondName,
    this.firstLastName,
    this.secondLastName,
    this.roles,
    this.token,
  });
  bool get isAdmin{
    return roles?.contains('admin') ?? false;
  }
}
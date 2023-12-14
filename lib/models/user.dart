class User {
  int id;
  String firstName;
  String lastName;
  String emailId;
  String role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      emailId: json['emailId'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailId'] = emailId;
    data['role'] = role;
    return data;
  }
}

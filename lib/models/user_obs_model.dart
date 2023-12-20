import 'package:get/get.dart';

class User {
  late RxInt id;
  late RxString firstName;
  late RxString lastName;
  late RxString emailId;
  late RxString role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as RxInt,
      firstName: json['firstName'] as RxString,
      lastName: json['lastName'] as RxString,
      emailId: json['emailId'] as RxString,
      role: json['role'] as RxString,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.value;
    data['firstName'] = firstName.value;
    data['lastName'] = lastName.value;
    data['emailId'] = emailId.value;
    data['role'] = role.value;
    return data;
  }
}

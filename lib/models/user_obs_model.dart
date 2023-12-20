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
      id: json['id'].obs,
      firstName: json['firstName'].obs,
      lastName: json['lastName'].obs,
      emailId: json['emailId'].obs,
      role: json['role'].obs,
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

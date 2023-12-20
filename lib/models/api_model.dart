// To parse this JSON data, do
//
//     final WelcomeModel = WelcomeModelFromJson(jsonString);

import 'dart:convert';


WelcomeModel WelcomeModelFromJson(String str) =>
    WelcomeModel.fromJson(json.decode(str));

String WelcomeModelToJson(WelcomeModel data) => json.encode(data.toJson());

class WelcomeModel {
  bool status;
  String message;
  String token;
  UserDetails userDetails;

  WelcomeModel({
    required this.status,
    required this.message,
    required this.token,
    required this.userDetails,
  });

  factory WelcomeModel.fromJson(Map<String, dynamic> json) => WelcomeModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  int id;
  String firstName;
  String lastName;
  String emailId;
  String role;

  UserDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.role,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailId: json["emailId"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "emailId": emailId,
        "role": role,
      };
}

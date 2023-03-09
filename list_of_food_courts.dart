// To parse this JSON data, do
//
//     final foodcourt = foodcourtFromJson(jsonString);

import 'dart:convert';

List<Foodcourt> foodcourtFromJson(String str) => List<Foodcourt>.from(json.decode(str).map((x) => Foodcourt.fromJson(x)));

String foodcourtToJson(List<Foodcourt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Foodcourt {
  Foodcourt({
   required this.id,
    required this.email,
    required this.firstName,
    required  this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Foodcourt.fromJson(Map<String, dynamic> json) => Foodcourt(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };

  @override
  String toString() {
    return 'Foodcourt{id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar}';
  }
}

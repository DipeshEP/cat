// To parse this JSON data, do
//
//     final dogList = dogListFromJson(jsonString);

import 'dart:convert';

DogList dogListFromJson(String str) => DogList.fromJson(json.decode(str));

String dogListToJson(DogList data) => json.encode(data.toJson());

class DogList {
  DogList({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory DogList.fromJson(Map<String, dynamic> json) => DogList(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}

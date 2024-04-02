import 'dart:convert';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  final String user;
  final String? email;
  final String? password;
  final bool? isLoggedIn;
  final int? exercisesCompleted;
  final int? totalExercises;
  final String? exerciseName;

  const Data({
    super.key,
    required this.user,
    this.email,
    this.password,
    this.isLoggedIn,
    this.exercisesCompleted,
    this.totalExercises,
    this.exerciseName,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] ?? '',
      email: json['email'] ?? '',
      isLoggedIn: json['isLoggedIn'] ?? false,
      exercisesCompleted: json['exercisesCompleted'] ?? 0,
      totalExercises: json['totalExercises'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'email': email,
      'isLoggedIn': isLoggedIn,
      'exercisesCompleted': exercisesCompleted,
      'totalExercises': totalExercises,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static Data fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return Data.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

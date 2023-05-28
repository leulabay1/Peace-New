import 'package:flutter/material.dart';

class user {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  late DateTime LastActive;

  user({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.LastActive,
  });

  factory user.fromJSON(Map<String, dynamic> _json) {
    return user(
      uid: _json["uid"],
      name: _json["name"],
      email: _json["email"],
      imageUrl: _json["imageUrl"],
      LastActive: _json["LastActive"].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "LastActive": LastActive,
      "image": imageUrl,
    };
  }

  String lastDayActive() {
    return "${LastActive.month}/${LastActive.day}/${LastActive.year}";
  }

  bool wasRecentlyActive() {
    return DateTime.now().difference(LastActive).inHours < 2;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? id;
  String role = '';
  String email = '';
  String? name;
  String? surname;
  String? position;
  String? phone;

  UserModel({
    this.id,
    required this.role,
    required this.email,
    this.name,
    this.surname,
    this.position,
    this.phone,
  });

  UserModel.fromDocumentSnapshot(
      {@required required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    email = documentSnapshot.data()!['email'];
    role = documentSnapshot.data()!['role'];
    name = documentSnapshot.data()!.containsKey('name')
        ? documentSnapshot.data()!['name']
        : '';
    surname = documentSnapshot.data()!.containsKey('surname')
        ? documentSnapshot.data()!['surname']
        : '';
    position = documentSnapshot.data()!.containsKey('position')
        ? documentSnapshot.data()!['position']
        : '';
    phone = documentSnapshot.data()!.containsKey('phone')
        ? documentSnapshot.data()!['phone']
        : '';
  }
}

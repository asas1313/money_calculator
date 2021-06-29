import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  late String uid;
  late String email;
  late String displayName;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
  });

  UserModel.fromDocumentSnapshot(
      {@required required DocumentSnapshot documentSnapshot}) {
    if (!documentSnapshot.exists) {
      return;
    }
    uid = documentSnapshot.id;
    final _temp = documentSnapshot.data()! as UserModel;
    email = _temp.email;
    displayName = _temp.displayName;
  }
}

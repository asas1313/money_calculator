import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalculationModel {
  late String id;
  late String email;
  late double sumInitial;
  late double sumCalculated;
  late DateTime operationTime;

  CalculationModel({
    required this.id,
    required this.email,
    required this.sumInitial,
    required this.sumCalculated,
    required this.operationTime,
  });

  CalculationModel.fromDocumentSnapshot(
      {@required required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    email = documentSnapshot.data()!['email'];
    sumInitial = documentSnapshot.data()!['sum_initial'];
    sumCalculated = documentSnapshot.data()!['sum_calculated'];
    operationTime = documentSnapshot.data()!['operationTime'].toDate();
  }
}

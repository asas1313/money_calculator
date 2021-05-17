import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalculationModel {
  late String id;
  late String email;
  late double sumInitial;
  late double sumCalculated;
  late int timestamp;

  CalculationModel({
    required this.id,
    required this.email,
    required this.sumInitial,
    required this.sumCalculated,
    required this.timestamp,
  });

  CalculationModel.fromDocumentSnapshot(
      {@required required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    email = documentSnapshot.data()!['email'];
    sumInitial =
        double.tryParse(documentSnapshot.data()!['sum_initial']) ?? 0.0;
    sumCalculated =
        double.tryParse(documentSnapshot.data()!['sum_calculated']) ?? 0.0;
    timestamp = int.tryParse(documentSnapshot.data()!['timestamp']) ?? 0;
  }
}

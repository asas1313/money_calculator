import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inkubox_app/app/models/calculation_model.dart';

class Firestore {
  final _firestore = FirebaseFirestore.instance.collection('calculations');

  Future<void> addCalculation(
      {required String email,
      required int timestamp,
      required double sumInitial,
      required double sumCalculated}) {
    return _firestore
        .doc(timestamp.toString() + '-' + email)
        .set({
          'email': email,
          'timestamp': timestamp.toString(),
          'sum_initial': sumInitial.toString(),
          'sum_calculated': sumCalculated.toString(),
        })
        .then((value) => print('Sum added to collection'))
        .catchError((error) => print('Failed to add sum: $error'));
  }

  Future<List<CalculationModel>> getAllCalculations() async {
    var _calculations = List<CalculationModel>.empty(growable: true);
    try {
      var _docs = await _firestore.get();
      _docs.docs.forEach((element) {
        _calculations.add(
            CalculationModel.fromDocumentSnapshot(documentSnapshot: element));
      });
      return _calculations;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CalculationModel> findCalculationById(String id) async {
    var _calculationModel;
    try {
      final snapshot = await _firestore.doc(id).get();
      _calculationModel =
          CalculationModel.fromDocumentSnapshot(documentSnapshot: snapshot);
      print(
          'Calculation from firestore loaded: ${_calculationModel.toString()}');
      return _calculationModel;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

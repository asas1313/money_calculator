import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final fb = FirebaseFirestore.instance;

  Future<String> getDBVersion() async {
    final _snapshot = await fb.collection('settings').doc('main').get();
    final _version = _snapshot.data()!.containsKey('db_version')
        ? _snapshot.data()!['db_version']
        : '';
    return _version;
  }

  Future<void> addCalculation(
      {required String email,
      required Timestamp timestamp,
      required double sumInitial,
      required double sumCalculated}) {
    return fb
        .collection('calculations')
        .add({
          'email': email,
          'timestamp': timestamp.toString(),
          'sum_initial': sumInitial.toString(),
          'sum_calculated': sumCalculated.toString(),
        })
        .then((value) => print('Sum added to collection'))
        .catchError((error) => print('Failed to add sum: $error'));
  }
}

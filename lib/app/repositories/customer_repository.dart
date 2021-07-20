import 'package:cloud_firestore/cloud_firestore.dart';

import '/app/models/customer_model.dart';

class CustomerRepository {
  final _customers = FirebaseFirestore.instance.collection('customers');
  final _email = FirebaseFirestore.instance.collection('mail');

  Future<List<CustomerModel>> getAll() async {
    var _list = List<CustomerModel>.empty(growable: true);
    try {
      var _docs = await _customers.get();
      _docs.docs.forEach((element) {
        _list
            .add(CustomerModel.fromDocumentSnapshot(documentSnapshot: element));
      });
      return _list;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  getById(String id) async {
    var customerModel;
    try {
      final snapshot = await _customers.doc(id).get();
      customerModel =
          CustomerModel.fromDocumentSnapshot(documentSnapshot: snapshot);
      print('Customer from firestore loaded: ' + customerModel.toString());
      return customerModel;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> save(CustomerModel model) async {
    if (model.id == null) {
      try {
        await _customers.add(model.toMap());

        await _email.add({
          'to': 'hello@inkubox.com',
          'message': {
            'subject': 'New customer registered in Inkubox App',
            'html': 'email: ${model.toString()}',
          },
        });
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      try {
        await _customers.doc(model.id).set(model.toMap());

        await _email.add({
          'to': 'hello@inkubox.com',
          'message': {
            'subject': 'Customer information updated in Inkubox App',
            'html': 'email: ${model.toString()}',
          },
        });
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    }
  }
}

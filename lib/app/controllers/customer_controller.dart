import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/models/customer_model.dart';
import '/app/repositories/customer_repository.dart';

class CustomerController extends GetxController {
  final id = ''.obs;
  final extId = ''.obs;
  final salutation = TextEditingController();
  final name = TextEditingController();
  final surname = TextEditingController();
  final position = TextEditingController();
  final eShopName = TextEditingController();
  final eShopUrl = TextEditingController();
  final eShopName2 = TextEditingController();
  final eShopUrl2 = TextEditingController();
  final companyName = TextEditingController();
  final companyCode = TextEditingController();
  final companyLegalStructure = TextEditingController();
  final registrationCountry = TextEditingController();
  final vatNumber = TextEditingController();
  final iossOssNumber = TextEditingController();
  final email = TextEditingController();
  final phoneCode = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final additionalInfo = TextEditingController();
  final postCode = TextEditingController();
  final city = TextEditingController();
  final country = TextEditingController();
  final accountant = TextEditingController();
  final accountantEmail = TextEditingController();

  final repository = CustomerRepository();

  CustomerController();

  Future load(String id) async {
    repository.getById(id).then((CustomerModel model) {
      salutation.text = model.salutation ?? '';
      name.text = model.name ?? '';
      surname.text = model.surname ?? '';
      position.text = model.position ?? '';
      eShopName.text = model.eShopName ?? '';
      eShopUrl.text = model.eShopUrl ?? '';
      eShopName2.text = model.eShopName2 ?? '';
      eShopUrl2.text = model.eShopUrl2 ?? '';
      companyName.text = model.companyName ?? '';
      companyCode.text = model.companyCode ?? '';
      companyLegalStructure.text = model.companyLegalStructure ?? '';
      registrationCountry.text = model.registrationCountry ?? '';
      vatNumber.text = model.vatNumber ?? '';
      iossOssNumber.text = model.iossOssNumber ?? '';
      email.text = model.email ?? '';
      phoneCode.text = model.phoneCode ?? '';
      phoneNumber.text = model.phoneNumber ?? '';
      address.text = model.address ?? '';
      additionalInfo.text = model.additionalInfo ?? '';
      postCode.text = model.postCode ?? '';
      city.text = model.city ?? '';
      country.text = model.country ?? '';
      accountant.text = model.accountant ?? '';
      accountantEmail.text = model.accountantEmail ?? '';
    });
  }

  save() {
    Get.snackbar('Information', 'Customer information saved.');
  }
}

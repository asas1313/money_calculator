import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerModel {
  String? id;
  String? extId;
  String? salutation;
  String? name;
  String? surname;
  String? position;
  String? eShopName;
  String? eShopUrl;
  String? eShopName2;
  String? eShopUrl2;
  String? companyName;
  String? companyCode;
  String? companyLegalStructure;
  String? registrationCountry;
  String? vatNumber;
  String? iossOssNumber;
  String? email;
  String? phoneCode;
  String? phoneNumber;
  String? address;
  String? additionalInfo;
  String? postCode;
  String? city;
  String? country;
  String? accountant;
  String? accountantEmail;

  CustomerModel.fromDocumentSnapshot(
      {@required required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    extId = documentSnapshot.data()!.containsKey('extId')
        ? documentSnapshot.data()!['extId']
        : '';
    salutation = documentSnapshot.data()!.containsKey('salutation')
        ? documentSnapshot.data()!['salutation']
        : '';
    name = documentSnapshot.data()!.containsKey('name')
        ? documentSnapshot.data()!['name']
        : '';
    surname = documentSnapshot.data()!.containsKey('surname')
        ? documentSnapshot.data()!['surname']
        : '';
    position = documentSnapshot.data()!.containsKey('position')
        ? documentSnapshot.data()!['position']
        : '';
    eShopName = documentSnapshot.data()!.containsKey('eShopName')
        ? documentSnapshot.data()!['eShopName']
        : '';
    eShopUrl = documentSnapshot.data()!.containsKey('eShopUrl')
        ? documentSnapshot.data()!['eShopUrl']
        : '';
    eShopName2 = documentSnapshot.data()!.containsKey('eShopName2')
        ? documentSnapshot.data()!['eShopName2']
        : '';
    eShopUrl2 = documentSnapshot.data()!.containsKey('eShopUrl2')
        ? documentSnapshot.data()!['eShopUrl2']
        : '';
    companyName = documentSnapshot.data()!.containsKey('companyName')
        ? documentSnapshot.data()!['companyName']
        : '';
    companyCode = documentSnapshot.data()!.containsKey('companyCode')
        ? documentSnapshot.data()!['companyCode']
        : '';
    companyLegalStructure =
        documentSnapshot.data()!.containsKey('companyLegalStructure')
            ? documentSnapshot.data()!['companyLegalStructure']
            : '';
    registrationCountry =
        documentSnapshot.data()!.containsKey('registrationCountry')
            ? documentSnapshot.data()!['registrationCountry']
            : '';
    vatNumber = documentSnapshot.data()!.containsKey('vatNumber')
        ? documentSnapshot.data()!['vatNumber']
        : '';
    iossOssNumber = documentSnapshot.data()!.containsKey('iossOssNumber')
        ? documentSnapshot.data()!['iossOssNumber']
        : '';
    email = documentSnapshot.data()!.containsKey('email')
        ? documentSnapshot.data()!['email']
        : '';
    phoneCode = documentSnapshot.data()!.containsKey('phoneCode')
        ? documentSnapshot.data()!['phoneCode']
        : '';
    phoneNumber = documentSnapshot.data()!.containsKey('phoneNumber')
        ? documentSnapshot.data()!['phoneNumber']
        : '';
    address = documentSnapshot.data()!.containsKey('address')
        ? documentSnapshot.data()!['address']
        : '';
    additionalInfo = documentSnapshot.data()!.containsKey('additionalInfo')
        ? documentSnapshot.data()!['additionalInfo']
        : '';
    postCode = documentSnapshot.data()!.containsKey('postCode')
        ? documentSnapshot.data()!['postCode']
        : '';
    city = documentSnapshot.data()!.containsKey('city')
        ? documentSnapshot.data()!['city']
        : '';
    country = documentSnapshot.data()!.containsKey('country')
        ? documentSnapshot.data()!['country']
        : '';
    accountant = documentSnapshot.data()!.containsKey('accountant')
        ? documentSnapshot.data()!['accountant']
        : '';
    accountantEmail = documentSnapshot.data()!.containsKey('accountantEmail')
        ? documentSnapshot.data()!['accountantEmail']
        : '';
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> _ret = {};
    if (extId != null && extId!.isNotEmpty) {
      _ret['extId'] = extId;
    }
    if (salutation != null && salutation!.isNotEmpty) {
      _ret['salutation'] = salutation;
    }
    if (name != null && name!.isNotEmpty) {
      _ret['name'] = name;
    }
    if (surname != null && surname!.isNotEmpty) {
      _ret['surname'] = surname;
    }
    if (position != null && position!.isNotEmpty) {
      _ret['position'] = position;
    }
    if (eShopName != null && eShopName!.isNotEmpty) {
      _ret['eShopName'] = eShopName;
    }
    if (eShopUrl != null && eShopUrl!.isNotEmpty) {
      _ret['eShopUrl'] = eShopUrl;
    }
    if (eShopName2 != null && eShopName2!.isNotEmpty) {
      _ret['eShopName2'] = eShopName2;
    }
    if (eShopUrl2 != null && eShopUrl2!.isNotEmpty) {
      _ret['eShopUrl2'] = eShopUrl2;
    }
    if (companyName != null && companyName!.isNotEmpty) {
      _ret['companyName'] = companyName;
    }
    if (companyCode != null && companyCode!.isNotEmpty) {
      _ret['companyCode'] = companyCode;
    }
    if (companyLegalStructure != null && companyLegalStructure!.isNotEmpty) {
      _ret['companyLegalStructure'] = companyLegalStructure;
    }
    if (registrationCountry != null && registrationCountry!.isNotEmpty) {
      _ret['registrationCountry'] = registrationCountry;
    }
    if (vatNumber != null && vatNumber!.isNotEmpty) {
      _ret['vatNumber'] = vatNumber;
    }
    if (iossOssNumber != null && iossOssNumber!.isNotEmpty) {
      _ret['iossOssNumber'] = iossOssNumber;
    }
    if (email != null && email!.isNotEmpty) {
      _ret['email'] = email;
    }
    if (phoneCode != null && phoneCode!.isNotEmpty) {
      _ret['phoneCode'] = phoneCode;
    }
    if (phoneNumber != null && phoneNumber!.isNotEmpty) {
      _ret['phoneNumber'] = phoneNumber;
    }
    if (address != null && address!.isNotEmpty) {
      _ret['address'] = address;
    }
    if (additionalInfo != null && additionalInfo!.isNotEmpty) {
      _ret['additionalInfo'] = additionalInfo;
    }
    if (postCode != null && postCode!.isNotEmpty) {
      _ret['postCode'] = postCode;
    }
    if (city != null && city!.isNotEmpty) {
      _ret['city'] = city;
    }
    if (country != null && country!.isNotEmpty) {
      _ret['country'] = country;
    }
    if (accountant != null && accountant!.isNotEmpty) {
      _ret['accountant'] = accountant;
    }
    if (accountantEmail != null && accountantEmail!.isNotEmpty) {
      _ret['accountantEmail'] = accountantEmail;
    }
    return _ret;
  }
}

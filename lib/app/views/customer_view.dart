import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/globals/widgets/form_controlls/data_form.dart';
import 'package:inkubox_app/app/globals/widgets/form_controlls/text_field.dart';

import '/app/controllers/customer_controller.dart';

class CustomerView extends GetWidget<CustomerController> {
  @override
  Widget build(BuildContext context) {
    return DataFormView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SimpleTextField(
            controller: controller.salutation,
            labelText: 'cutomer_edit_salutation',
          ),
          SimpleTextField(
            controller: controller.name,
            labelText: 'cutomer_edit_name',
          ),
          SimpleTextField(
            controller: controller.surname,
            labelText: 'cutomer_edit_surname',
          ),
          SimpleTextField(
            controller: controller.position,
            labelText: 'cutomer_edit_position',
          ),
          SimpleTextField(
            controller: controller.eShopName,
            labelText: 'cutomer_edit_eshop_name',
          ),
          SimpleTextField(
            controller: controller.eShopUrl,
            labelText: 'cutomer_edit_eshop_url',
          ),
          SimpleTextField(
            controller: controller.eShopName2,
            labelText: 'cutomer_edit_esop_name2',
          ),
          SimpleTextField(
            controller: controller.eShopUrl2,
            labelText: 'cutomer_edit_eshop_url2',
          ),
          SimpleTextField(
            controller: controller.companyCode,
            labelText: 'cutomer_edit_company_code',
          ),
          SimpleTextField(
            controller: controller.companyLegalStructure,
            labelText: 'cutomer_edit_company_legal_structure',
          ),
          SimpleTextField(
            controller: controller.registrationCountry,
            labelText: 'cutomer_edit_registration_country',
          ),
          SimpleTextField(
            controller: controller.vatNumber,
            labelText: 'cutomer_edit_vat_number',
          ),
          SimpleTextField(
            controller: controller.iossOssNumber,
            labelText: 'cutomer_edit_ioss_oss_number',
          ),
          SimpleTextField(
            controller: controller.email,
            labelText: 'cutomer_edit_email',
          ),
          SimpleTextField(
            controller: controller.phoneCode,
            labelText: 'cutomer_edit_phone_code',
          ),
          SimpleTextField(
            controller: controller.phoneNumber,
            labelText: 'cutomer_edit_phone_number',
          ),
          SimpleTextField(
            controller: controller.address,
            labelText: 'cutomer_edit_address',
          ),
          SimpleTextField(
            controller: controller.additionalInfo,
            labelText: 'cutomer_edit_additional_info',
          ),
          SimpleTextField(
            controller: controller.postCode,
            labelText: 'cutomer_edit_post_code',
          ),
          SimpleTextField(
            controller: controller.city,
            labelText: 'cutomer_edit_city',
          ),
          SimpleTextField(
            controller: controller.country,
            labelText: 'cutomer_edit_country',
          ),
          SimpleTextField(
            controller: controller.accountant,
            labelText: 'cutomer_edit_accountant',
          ),
          SimpleTextField(
            controller: controller.accountantEmail,
            labelText: 'cutomer_edit_accountant_email',
          ),
        ],
      ),
    );
  }
}

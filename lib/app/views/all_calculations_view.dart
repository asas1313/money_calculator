import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/controllers/all_calculations_controller.dart';
import 'package:inkubox_app/app/views/styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/authenticated.dart';
import 'widgets/calculation_card.dart';

class AllCalculationsView extends GetWidget<AllCalculationsController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: FittedBox(
        fit: BoxFit.contain,
        child: SingleChildScrollView(
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              var width = Get.width / 1.2;
              return SizedBox(
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              SizedBox(height: 25),
                              Card(
                                color: SECONDARY_COLOR,
                                child: ListTile(
                                  title: SizedBox(
                                    child: Text('Filters'),
                                  ),
                                  subtitle: Text(''),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: SizedBox(
                                    child: Text('Initial sum'),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      TextFormField(
                                        controller: controller.filterGreater,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d*')),
                                        ],
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        decoration: InputDecoration(
                                          labelText: 'greater than',
                                        ),
                                      ),
                                      Divider(),
                                      TextFormField(
                                        controller: controller.filterEquals,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d*')),
                                        ],
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        decoration: InputDecoration(
                                          labelText: 'equals',
                                        ),
                                      ),
                                      Divider(),
                                      TextFormField(
                                        controller: controller.filterLess,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d*')),
                                        ],
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        decoration: InputDecoration(
                                          labelText: 'less than',
                                        ),
                                      ),
                                      Divider(),
                                      ElevatedButton(
                                          onPressed: () =>
                                              controller.clearFilters(),
                                          child: Text('Clear'))
                                    ],
                                  ),
                                ),
                              ),
                              Text(''),
                            ],
                          ),
                        )),
                    Divider(),
                    Flexible(
                      flex: 4,
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Container(
                                width: (width / 5) * 4,
                                child: Card(
                                  color: PRIMARY_COLOR,
                                  child: ListTile(
                                    title: SizedBox(
                                      child: Text('E-mail'),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text('Operation time'),
                                        Spacer(),
                                        Text('Initial sum'),
                                        Spacer(),
                                        Text('Calculated sum'),
                                        Spacer(),
                                        Text('EUR to USD rate'),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Obx(() => Container(
                                width: width,
                                height: 400,
                                child: ListView.builder(
                                    itemCount:
                                        controller.filterredCalculations.length,
                                    itemBuilder: (context, index) {
                                      return CalculationCard(
                                          model: controller
                                              .filterredCalculations[index]);
                                    }),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

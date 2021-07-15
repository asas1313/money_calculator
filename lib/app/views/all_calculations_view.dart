import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/all_calculations_controller.dart';
import '../globals/styles/colors.dart';
import '../globals/widgets/app_controls/authenticated.dart';

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
                                    child: Text(
                                      'all_calculations_filters_title'.tr,
                                    ),
                                  ),
                                  subtitle: Text(''),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: SizedBox(
                                    child: Text(
                                      'all_calculations_filter_initial_sum'.tr,
                                    ),
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
                                          labelText:
                                              'all_calculations_filter_greater_than'
                                                  .tr,
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
                                          labelText:
                                              'all_calculations_filter_equals'
                                                  .tr,
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
                                          labelText:
                                              'all_calculations_filter_less_than'
                                                  .tr,
                                        ),
                                      ),
                                      Divider(),
                                      ElevatedButton(
                                          onPressed: () =>
                                              controller.clearFilters(),
                                          child: Text(
                                            'all_calculations_filter_clear_button'
                                                .tr,
                                          )),
                                      Divider(),
                                      ElevatedButton(
                                          onPressed: () =>
                                              controller.refreshAll(),
                                          child: Text(
                                            'all_calculations_filter_refresh_button'
                                                .tr,
                                          ))
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
                                      child: Text(
                                        'all_calculations_column_email'.tr,
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          'all_calculations_column_operation_time'
                                              .tr,
                                        ),
                                        Spacer(),
                                        Text(
                                          'all_calculations_column_initial_sum'
                                              .tr,
                                        ),
                                        Spacer(),
                                        Text(
                                          'all_calculations_column_calculated_sum'
                                              .tr,
                                        ),
                                        Spacer(),
                                        Text(
                                          'all_calculations_column_rate'.tr,
                                        ),
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
                                      return Card(
                                        child: ListTile(
                                          onTap: () => _checkCard(),
                                          title: SizedBox(
                                            width: Get.width / 1.2,
                                            child: Text(controller
                                                .filterredCalculations[index]
                                                .email),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Text(controller
                                                  .filterredCalculations[index]
                                                  .operationTime
                                                  .toIso8601String()),
                                              Spacer(),
                                              Text(
                                                  '${controller.filterredCalculations[index].sumInitial}'),
                                              Spacer(),
                                              Text(
                                                  '${controller.filterredCalculations[index].sumCalculated}'),
                                              Spacer(),
                                              Text(
                                                  '${controller.filterredCalculations[index].currencyRate}'),
                                            ],
                                          ),
                                        ),
                                      );
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

  _checkCard() {
    Get.snackbar('Message', 'Row checked');
  }
}

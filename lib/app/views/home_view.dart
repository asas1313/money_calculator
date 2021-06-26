import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          Text(
            'Inkubox',
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      )),
    );
  }
}

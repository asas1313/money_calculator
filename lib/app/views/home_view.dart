import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Text(
        'Inkubox',
        style: Theme.of(context).textTheme.headline1,
      ),
    ));
  }
}

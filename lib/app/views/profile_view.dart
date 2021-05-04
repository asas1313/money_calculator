import 'package:flutter/material.dart';
import 'package:inkubox_app/app/views/widgets/authenticated.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: Container(
          child: Center(
        child: Text('ProfileView'),
      )),
    );
  }
}

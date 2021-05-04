import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkubox_app/app/routes/app_routing.dart';
import 'package:inkubox_app/app/views/styles/colors.dart';
import 'package:inkubox_app/app/views/styles/styles.dart';

const logo_text_primary = TextStyle(
  fontFamily: 'Saira',
  fontSize: 30,
  fontWeight: FontWeight.w900,
  letterSpacing: 0.19,
  color: PRIMARY_COLOR,
);
const big_letter_primary = TextStyle(
  fontFamily: 'Saira',
  fontSize: 36,
  fontWeight: FontWeight.w900,
  letterSpacing: 0.19,
  color: PRIMARY_COLOR,
);
const logo_text_secondary = TextStyle(
  fontFamily: 'Saira',
  fontSize: 30,
  fontWeight: FontWeight.w900,
  letterSpacing: 0.19,
  color: SECONDARY_COLOR,
);
const big_letter_secondary = TextStyle(
  fontFamily: 'Saira',
  fontSize: 36,
  fontWeight: FontWeight.w900,
  letterSpacing: 0.19,
  color: SECONDARY_COLOR,
);

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0),
        child: TextButton(
          onPressed: () => Get.toNamed(Routes.HOME),
          child: Stack(children: [
            Image.asset('assets/img/logo.png'),
          ]),
        ));
  }
}

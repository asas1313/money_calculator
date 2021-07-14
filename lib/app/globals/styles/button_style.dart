import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle smallButtonStyle(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .caption!
      .apply(color: Theme.of(context).backgroundColor);
}

TextStyle smallTextButtonStyle(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .caption!
      .apply(color: Theme.of(context).primaryColor);
}

TextStyle navigationButtonStyle(BuildContext context) {
  return Theme.of(context).textTheme.headline4!.apply(fontWeightDelta: 900);
}

TextStyle navigationSmallButtonStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyText2!.apply(fontWeightDelta: 900);
}

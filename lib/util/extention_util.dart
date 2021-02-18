import 'package:flutter/material.dart';

extension MediaQueryPercentage on num {
  double heightPercentage(BuildContext context) {
    return MediaQuery.of(context).size.height * (this);
  }

  double widthPercentage(BuildContext context) {
    return MediaQuery.of(context).size.width * (this);
  }
}
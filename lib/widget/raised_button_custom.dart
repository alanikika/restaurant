import 'package:flutter/material.dart';
import 'package:restaurant_alan/common/custom_colors.dart';
import 'package:restaurant_alan/common/dimens.dart';
import 'package:restaurant_alan/common/styles.dart';
import 'package:restaurant_alan/util/extention_util.dart';

class RaisedButtonCustom extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  final double buttonHeight;

  RaisedButtonCustom({
    @required this.onPressed,
    @required this.buttonText,
    this.textColor = CustomColors.whiteFCFCFC,
    this.buttonColor = CustomColors.primaryColor,
    this.buttonHeight,
  });

  @override
  _RaisedButtonCustomState createState() => _RaisedButtonCustomState();
}

class _RaisedButtonCustomState extends State<RaisedButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.widthPercentage(context),
      height: widget.buttonHeight ?? Dimens.standard_56,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.standard_4)),
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonText,
          textAlign: TextAlign.center,
          style: Style.ibmPleXSansBold.copyWith(
            fontSize: Dimens.standard_16,
            letterSpacing: Dimens.letterSpacing_15,
          ),
        ),
        textColor: widget.textColor,
        color: widget.buttonColor,
      ),
    );
  }
}

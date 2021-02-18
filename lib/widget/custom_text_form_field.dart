import 'package:flutter/material.dart';
import 'package:restaurant_alan/common/custom_colors.dart';
import 'package:restaurant_alan/common/dimens.dart';
import 'package:restaurant_alan/common/styles.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key key,
      this.labelText,
      this.isPwdType = false,
      this.controller,
      this.errorText,
      this.suffixImage,
      this.maxLines = 1,
      this.minLines = 1,
      this.prefix,
      this.isEnabled = true,
      this.borderHeight,
      this.textCapitalization = TextCapitalization.none,
      this.keyboardType = TextInputType.text,
      this.inputFormatter,
      this.inputAction = TextInputAction.none,
      this.onChange})
      : super(key: key);

  final String labelText;
  final String prefix;
  final bool isPwdType;
  final double borderHeight;
  final String errorText;
  final bool isEnabled;
  final String suffixImage;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final inputFormatter;
  final textCapitalization;
  final TextInputAction inputAction;
  final void Function(String) onChange;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color focusColor = CustomColors.primaryColor.withOpacity(0.5);
  Color labelColor = CustomColors.textDarkHighDE082022.withOpacity(0.5);
  bool focus = false;
  double labelPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (value) {
          setState(() {
            if (value) {
              labelColor = CustomColors.colorOrangeF7931D;
              focusColor = CustomColors.colorOrangeF7931D;
              focus = value;
              labelPadding = Dimens.standard_16;
            } else {
              labelColor = CustomColors.textDarkHighDE082022.withOpacity(0.5);
              focusColor = CustomColors.primaryColor.withOpacity(0.5);
              focus = value;
              labelPadding = widget.controller.text.isNotEmpty
                  ? Dimens.standard_16
                  : Dimens.standard_0;
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: widget.borderHeight ?? Dimens.standard_56,
              decoration: BoxDecoration(
                color: (focus || widget.errorText != null)
                    ? widget.errorText != null
                        ? CustomColors.errorTextColor.withOpacity(.1)
                        : focusColor.withOpacity(0.1)
                    : CustomColors.whiteFFFFFF,
                border: Border.all(
                  color: widget.errorText != null
                      ? CustomColors.errorTextColor
                      : focusColor,
                ),
                borderRadius: BorderRadius.circular(
                  Dimens.standard_8,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: focus || widget.controller.text.isNotEmpty
                      ? Dimens.standard_12
                      : 0.0,
                ),
                child: Stack(
                  children: <Widget>[
                    widget.suffixImage != null
                        ? Positioned(
                            bottom: Dimens.standard_22,
                            right: Dimens.standard_10,
                            child: Container(
                              width: Dimens.standard_12,
                              height: Dimens.standard_7,
                              child: Image.asset(widget.suffixImage),
                            ),
                          )
                        : SizedBox(),
                    TextFormField(
                      style: Style.ibmPleXSansRegular.copyWith(
                        fontSize: Dimens.standard_16,
                        color: CustomColors.textDarkHighDE082022,
                      ),
                      inputFormatters: widget.inputFormatter,
                      controller: widget.controller,
                      keyboardType: widget.keyboardType,
                      obscureText: widget.isPwdType,
                      enabled: widget.isEnabled,
                      textCapitalization: widget.textCapitalization,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      textInputAction: widget.inputAction,
                      onChanged: widget.onChange,
                      decoration: InputDecoration(
                        fillColor: CustomColors.primaryColor,
                        focusColor: CustomColors.primaryColor,
                        contentPadding: EdgeInsets.only(
                          left: Dimens.standard_16,
                          top: Dimens.standard_14,
                          bottom: Dimens.standard_20,
                          right: Dimens.standard_16,
                        ),
                        isDense: true,
                        prefix: widget.prefix == null
                            ? SizedBox()
                            : Text(
                                widget.prefix,
                                style: Style.ibmPleXSansBold.copyWith(
                                  fontSize: Dimens.standard_16,
                                  color: widget.errorText != null
                                      ? CustomColors.errorTextColor
                                      : labelColor,
                                ),
                              ),
                        labelText: widget.labelText,
                        labelStyle: Style.ibmPleXSansRegular.copyWith(
                          fontSize: Dimens.standard_16,
                          color: widget.errorText != null
                              ? CustomColors.errorTextColor
                              : labelColor,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Dimens.standard_4,
            ),
            widget.errorText != null
                ? Container(
                    margin: EdgeInsets.only(bottom: Dimens.standard_4),
                    child: Text(
                      widget.errorText,
                      style: Style.ibmPleXSansRegular.copyWith(
                        fontSize: Dimens.standard_12,
                        color: CustomColors.errorTextColor,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

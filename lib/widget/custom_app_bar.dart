import 'package:flutter/material.dart';
import 'package:restaurant_alan/common/custom_colors.dart';
import 'package:restaurant_alan/common/dimens.dart';
import 'package:restaurant_alan/common/image_path.dart';
import 'package:restaurant_alan/common/styles.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title, backImage;
  final bool backFlag;
  final VoidCallback onClickBackImage;
  final Color backgroundColor, backImageColor, titleColor;
  final TextStyle textStyle;

  CustomAppBar({
    this.title,
    this.backImage,
    this.backFlag = true,
    this.onClickBackImage,
    this.backgroundColor,
    this.backImageColor,
    this.titleColor = CustomColors.appBarText153639,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: backFlag,
        backgroundColor: backgroundColor ?? CustomColors.whiteFFFFFF,
        brightness: Brightness.dark,
        leading: backFlag
            ? InkWell(
                onTap: () => onClickBackImage == null
                    ? Navigator.pop(context)
                    : onClickBackImage(),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: Dimens.standard_28),
                      child: Image.asset(
                        backImage == null ? ImagePath.backArrow : backImage,
                        color: backImageColor == null
                            ? CustomColors.topText283D3F
                            : backImageColor,
                        height: Dimens.standard_16,
                        width: Dimens.standard_16,
                      ),
                    ),
                  ],
                ),
              )
            : null,
        title: Text(
          title,
          style: textStyle ??
              Style.ibmPleXSansBold.copyWith(
                fontSize: Dimens.standard_16,
                color: titleColor,
                fontWeight: FontWeight.w500,
                letterSpacing: .15,
              ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

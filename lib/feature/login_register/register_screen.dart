import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_alan/base/base_state.dart';
import 'package:restaurant_alan/common/custom_colors.dart';
import 'package:restaurant_alan/common/dimens.dart';
import 'package:restaurant_alan/common/req_id.dart';
import 'package:restaurant_alan/common/routes.dart';
import 'package:restaurant_alan/common/strings.dart';
import 'package:restaurant_alan/feature/login_register/register_provider.dart';
import 'package:restaurant_alan/util/navigation.dart';
import 'package:restaurant_alan/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_alan/widget/custom_text_form_field.dart';
import 'package:restaurant_alan/widget/progressbar.dart';
import 'package:restaurant_alan/widget/raised_button_custom.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen> {
  RegisterProvider _registerProvider;

  @override
  void initState() {
    _registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteFFFFFF,
      appBar: CustomAppBar(
        title: Strings.register.toUpperCase(),
        onClickBackImage: _onClickBackButton,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimens.standard_16,
        ),
        child: Consumer<RegisterProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: Dimens.standard_10,
                  ),
                  CustomTextField(
                    labelText: "Username",
                    controller: provider.usernameController,
                    keyboardType: TextInputType.text,
                    errorText: provider.usernameValidate,
                  ),
                  SizedBox(
                    height: provider.usernameValidate == null
                        ? Dimens.standard_16
                        : Dimens.standard_0,
                  ),
                  CustomTextField(
                    labelText: "Password",
                    controller: provider.passwordController,
                    isPwdType: true,
                    keyboardType: TextInputType.number,
                    errorText: provider.passwordValidate,
                  ),
                  SizedBox(
                    height: provider.passwordValidate == null
                        ? Dimens.standard_16
                        : Dimens.standard_0,
                  ),
                  CustomTextField(
                    labelText: "Confirm Password",
                    controller: provider.verifyPasswordController,
                    isPwdType: true,
                    keyboardType: TextInputType.number,
                    errorText: provider.verifyPasswordValidate,
                  ),
                  SizedBox(
                    height: provider.verifyPasswordValidate == null
                        ? Dimens.standard_16
                        : Dimens.standard_0,
                  ),
                  CustomTextField(
                    labelText: Strings.nationality,
                    controller: provider.nationalityController,
                    keyboardType: TextInputType.text,
                    errorText: provider.nationalityValidate,
                  ),
                  SizedBox(
                    height: provider.nationalityValidate == null
                        ? Dimens.standard_16
                        : Dimens.standard_0,
                  ),
                  CustomTextField(
                    labelText: Strings.nickName,
                    controller: provider.nicknameController,
                    keyboardType: TextInputType.text,
                    errorText: provider.nickNameValidate,
                  ),
                  SizedBox(
                    height: provider.nickNameValidate == null
                        ? Dimens.standard_16
                        : Dimens.standard_0,
                  ),
                  CustomTextField(
                    labelText: Strings.dateOfBirth,
                    controller: provider.dateOfBirthController,
                    keyboardType: TextInputType.text,
                    errorText: provider.dateOfBirthValidate,
                  ),
                  SizedBox(
                    height: provider.dateOfBirthValidate == null
                        ? Dimens.standard_16
                        : Dimens.standard_0,
                  ),
                  RaisedButtonCustom(
                    buttonText: Strings.register.toUpperCase(),
                    onPressed: _onClickRegister,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _onClickRegister() {
    FocusScope.of(context).requestFocus(FocusNode());
    _registerProvider.listener = this;
    _registerProvider.validateRegister(context);
  }

  _onClickBackButton() {
    // _registerProvider.clearTextController();
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pop(context);
  }

  @override
  void onSuccess(any, {int reqId}) {
    ProgressBar.instance.hideProgressBar();
    switch (reqId) {
      case ReqIds.REGISTER_USER:
        Navigation.navigatePushNamedAndRemoveAll(context, Routes.login);
        break;
    }
    super.onSuccess(any);
  }
}

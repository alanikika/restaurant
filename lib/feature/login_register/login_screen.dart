import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_alan/base/base_state.dart';
import 'package:restaurant_alan/common/constants.dart';
import 'package:restaurant_alan/common/custom_colors.dart';
import 'package:restaurant_alan/common/dimens.dart';
import 'package:restaurant_alan/common/req_id.dart';
import 'package:restaurant_alan/common/routes.dart';
import 'package:restaurant_alan/common/strings.dart';
import 'package:restaurant_alan/feature/login_register/login_provider.dart';
import 'package:restaurant_alan/model/User.dart';
import 'package:restaurant_alan/util/navigation.dart';
import 'package:restaurant_alan/util/shared_pref_manager.dart';
import 'package:restaurant_alan/widget/custom_app_bar.dart';
import 'package:restaurant_alan/widget/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_alan/widget/progressbar.dart';
import 'package:restaurant_alan/widget/raised_button_custom.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginProvider _loginProvider;

  @override
  void initState() {
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteFFFFFF,
      appBar: CustomAppBar(
        title: Strings.login.toUpperCase(),
        backFlag: false,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimens.standard_16),
        child: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            return Column(
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
                      ? Dimens.standard_24
                      : Dimens.standard_0,
                ),
                CustomTextField(
                  labelText: "Password",
                  controller: provider.passwordController,
                  isPwdType: true,
                  keyboardType: TextInputType.text,
                  errorText: provider.passwordValidate,
                ),
                SizedBox(
                  height: provider.passwordValidate == null
                      ? Dimens.standard_36
                      : Dimens.standard_24,
                ),
                RaisedButtonCustom(
                  buttonText: Strings.login.toUpperCase(),
                  onPressed: _onClickLogin,
                ),
                SizedBox(
                  height: Dimens.standard_16,
                ),
                RaisedButtonCustom(
                  buttonText: Strings.register.toUpperCase(),
                  onPressed: _onClickRegister,
                ),
                SizedBox(
                  height: Dimens.standard_16,
                ),
                RaisedButtonCustom(
                  buttonText: Strings.reset.toUpperCase(),
                  onPressed: _onClickReset,
                ),
                SizedBox(
                  height: Dimens.standard_36,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _onClickLogin() {
    FocusScope.of(context).requestFocus(FocusNode());
    _loginProvider.listener = this;
    _loginProvider.validateLogin(context);
  }

  _onClickRegister() {
    Navigation.navigateTo(context, Routes.register);
  }

  _onClickReset() {
    FocusScope.of(context).requestFocus(FocusNode());
    _loginProvider.listener = this;
    _loginProvider.validateLogin(context);
  }

  @override
  void onSuccess(any, {int reqId}) {
    ProgressBar.instance.hideProgressBar();
    switch (reqId) {
      case ReqIds.LOGIN:
        User user = any as User;
        SharedPrefManager.instance.setString(Constants.USERNAME, user.username);
        Navigation.navigatePushNamedAndRemoveAll(context, Routes.navMenu);
        break;
    }
    super.onSuccess(any);
  }
}

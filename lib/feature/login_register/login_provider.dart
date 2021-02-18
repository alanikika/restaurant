import 'package:flutter/cupertino.dart';
import 'package:restaurant_alan/base/base_provider.dart';
import 'package:restaurant_alan/common/req_id.dart';
import 'package:restaurant_alan/data/database_provider.dart';
import 'package:restaurant_alan/model/User.dart';
import 'package:restaurant_alan/util/validate_input.dart';

class LoginProvider extends BaseProvider {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameValidate, passwordValidate;

  final dbProvider = DatabaseProvider.instance;

  validateLogin(BuildContext context) {
    String usernameValidation =
        ValidateInput().validateInputUsername(usernameController.text);
    String passwordValidation =
        ValidateInput().validateInputPassword(passwordController.text);

    if (usernameValidation != null) {
      usernameValidate = usernameValidation;
    } else if (passwordValidation != null) {
      passwordValidate = passwordValidation;
      usernameValidate = null;
    } else if (usernameValidation != null && passwordValidation != null) {
      usernameValidate = usernameValidation;
      passwordValidate = passwordValidation;
    } else {
      // ProgressBar.instance.showProgressbarWithContext(context);
      _loginAction();
    }
    notifyListeners();
  }

  _loginAction() async {
    User user = await dbProvider.getUser(
      usernameController.text,
      passwordController.text,
    );

    if(user != null) {
      debugPrint("user data: ${user.toJson()}");
      listener.onSuccess(user, reqId: ReqIds.LOGIN);
    } else {
      listener.onFailure("Login failed");
    }
  }
}

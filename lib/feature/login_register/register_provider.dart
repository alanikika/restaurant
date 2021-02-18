import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:restaurant_alan/base/base_provider.dart';
import 'package:restaurant_alan/common/req_id.dart';
import 'package:restaurant_alan/data/database_provider.dart';

class RegisterProvider extends BaseProvider {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  String usernameValidate,
      passwordValidate,
      verifyPasswordValidate,
      nameValidate,
      nationalityValidate,
  nickNameValidate,
      dateOfBirthValidate;


  final dbProvider = DatabaseProvider.instance;

  validateRegister(BuildContext context) {
    registerAction();
  }

  registerAction() async {
    String username = usernameController.text;
    String password = passwordController.text;
    String nationality = nationalityController.text;
    String nickName = nicknameController.text;
    String dateOfBirth = dateOfBirthController.text;

    Map<String, dynamic> map = HashMap();
    map["username"] = username;
    map["password"] = password;
    map["nick_name"] = nickName;
    map["nationality"] = nationality;
    map["date_birth"] = dateOfBirth;
    debugPrint("exec query");
    int id = await dbProvider.insertUser(map);
    debugPrint("----- $id");
    if(id > 0) {
      listener.onSuccess(id, reqId: ReqIds.REGISTER_USER);
    } else {
      listener.onFailure("register failed");
    }
  }

}

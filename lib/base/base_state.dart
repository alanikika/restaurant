import 'package:flutter/material.dart';
import 'package:restaurant_alan/base/callback_listener.dart';
import 'package:restaurant_alan/util/error_handling.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements OnCallbackListener {
  @override
  void onFailure(dynamic error) {
    ErrorHandling.errorValidation(context, error);
  }

  @override
  void onSuccess(any, {int reqId}) {}
}
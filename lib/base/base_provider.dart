import 'package:flutter/material.dart';
import 'package:restaurant_alan/base/base_model.dart';
import 'package:restaurant_alan/base/callback_listener.dart';

abstract class BaseProvider<T extends BaseModel> with ChangeNotifier
{
  OnCallbackListener listener;

  @override
  void dispose() {
    super.dispose();
  }
}
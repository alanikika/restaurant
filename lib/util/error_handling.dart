import 'package:flutter/material.dart';
import 'package:restaurant_alan/util/code_snippet.dart';
import 'package:restaurant_alan/widget/progressbar.dart';

class ErrorHandling
{
  static void errorValidation(BuildContext context, String response) {
    ProgressBar.instance.hideProgressBar();
    CodeSnippet.instance.showAlertMsg(response);
  }
}
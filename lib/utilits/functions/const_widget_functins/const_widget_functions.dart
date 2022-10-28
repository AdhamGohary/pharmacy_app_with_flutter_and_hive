import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

showAwsomeDialog(
    {required BuildContext context,
    required DialogType dialogType,
    required String title,
    required String desc}) {
  return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      title: title,
      desc: desc,
      width: 0.3*getwidth(context: context),
      dialogBackgroundColor: Colors.lightBlue[100],
      btnOk: CustomBtn(
        function: () => Navigator.of(context).pop(),
        color: Colors.lightBlue,
        txt: "Ok",
        textStyle: style4,
        height: 0.05 * getHeight(context: context),
        width: 0.05 * getwidth(context: context),
      )).show();
}

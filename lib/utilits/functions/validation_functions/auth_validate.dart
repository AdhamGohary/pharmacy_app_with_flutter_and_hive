import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/repo/services/auth_hive_service/auth_hive_service.dart';
import 'package:pharmacy_app/utilits/constants/strings.dart';
import 'package:pharmacy_app/utilits/functions/const_functions/const_functions.dart';
import 'package:pharmacy_app/utilits/functions/const_widget_functins/const_widget_functions.dart';
import 'package:pharmacy_app/view-model/sign_up_model/sign_up_model.dart';
import 'package:provider/provider.dart';

class AuthValidate {
  static signUpValidate({
    required BuildContext context,
    required GlobalKey<FormState> pharmacyKey,
    required GlobalKey<FormState> emailKey,
    required GlobalKey<FormState> passwordKey,
    required Box myBox,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController pharmacyController,
  }) {
    var formData1 = pharmacyKey.currentState;
    var formData2 = emailKey.currentState;
    var formData3 = passwordKey.currentState;
    try {
      if (formData1!.validate() &&
          formData2!.validate() &&
          formData3!.validate()) {
        if (myBox.keys.contains(emailController.text.trim())) {
          showAwsomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: errorTitle,
              desc: 'This Account Already Exist');
        } else {
          AuthHiveService.auth.signUpWithHive(pharmacyController.text,
              emailController.text, passwordController.text);
          pharmacyController.clear();
          emailController.clear();
          passwordController.clear();
          showAwsomeDialog(
              context: context,
              dialogType: DialogType.success,
              title: successTitle,
              desc: 'The Account is created successfully');
        }
      }
    } catch (e) {
      checkDebugMode(e);
    }
  }

//-------------------------------------------------------
  static logInValidate({
    required BuildContext context,
    required GlobalKey<FormState> emailKey,
    required GlobalKey<FormState> passwordKey,
    required Box myBox,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    if (myBox.keys.contains(emailController.text.trim())) {
      if (passwordController.text == myBox.get(emailController.text).password) {
        Provider.of<SignUpViewModel>(context, listen: false).nameOfPharmacy =
            myBox.get(emailController.text).pharmacyName;
        return true;
      } else {
        showAwsomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: 'Invalid Password',
        );
        return false;
      }
    } else {
      showAwsomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: 'Error',
        desc: 'Invalid Email',
      );
      return false;
    }
  }
}

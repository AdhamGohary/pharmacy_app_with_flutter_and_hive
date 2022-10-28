import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/sign_up_model/sign_up_model.dart';
import 'package:pharmacy_app/utilits/functions/const_functions/const_functions.dart';


class AuthHiveService {
  static AuthHiveService auth = AuthHiveService();
  late Box myBox;

  signUpWithHive(String pharmacyName, String email, String password) async {
    myBox = Hive.box<SignUpModel>('userInfoAuth');

    try {
      await myBox.put(
          email,
          SignUpModel(
              email: email, password: password, pharmacyName: pharmacyName));
    } catch (e) {
      checkDebugMode(e);
    }
  }

  
  
}

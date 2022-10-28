import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/sign_up_model/sign_up_model.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/ui/widgets/my_circle_avatar/my_circle_avatar.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/functions/validation_functions/auth_validate.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> pharmacyKey = GlobalKey();
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();
  TextEditingController pharmacyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Box myBox;

  @override
  void initState() {
    super.initState();

    myBox = Hive.box<SignUpModel>('userInfoAuth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
        title: const Text(
          'Create Account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 0.6 * getHeight(context: context)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(0.1 * getHeight(context: context)),
              child: MyCircleAvatar(
                maxRadius:0.1 * getwidth(context: context),
                child: Image.asset('images/snake.jpg',),
              ),
            ),
            CustomTxtFormField(
              hintText: 'Pharmacy Name',
              obScure: false,
              maxLines: 1,
              ifBody: 'Please enter name of pharmacy',
              myKey: pharmacyKey,
              regExpSource:
                  r'\w(\d|\D)(\s|\S)|[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FF]',
              textEditingController: pharmacyController,
              autovalidateMode: AutovalidateMode.disabled,
              caseSensitive: false,
              keyBoardType: TextInputType.name,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 0.02 * getHeight(context: context),
                  bottom: 0.02 * getHeight(context: context)),
              child: CustomTxtFormField(
                hintText: 'Email',
                obScure: false,
                maxLines: 1,
                ifBody: 'The email must be example@pharma.com ',
                myKey: emailKey,
                regExpSource: r'\w(\D|\d)@pharma.com',
                textEditingController: emailController,
                autovalidateMode: AutovalidateMode.disabled,
                caseSensitive: true,
                keyBoardType: TextInputType.emailAddress,
              ),
            ),
            CustomTxtFormField(
              hintText: 'Password',
              obScure: true,
              maxLines: 1,
              ifBody: 'Password should be grater than 4 , No Space',
              myKey: passwordKey,
              regExpSource: r'(\d|(\w|\W)){4}',
              textEditingController: passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              caseSensitive: false,
              keyBoardType: TextInputType.visiblePassword,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.03 * getHeight(context: context)),
              child: CustomBtn(
                color: Colors.transparent,
                txt: 'Sign Up',
                textStyle: style1,
                height: 0.05 * getHeight(context: context),
                width: 0.0001 * getwidth(context: context),
                function: () => AuthValidate.signUpValidate(
                    context: context,
                    pharmacyKey: pharmacyKey,
                    emailKey: emailKey,
                    passwordKey: passwordKey,
                    myBox: myBox,
                    emailController: emailController,
                    passwordController: passwordController,
                    pharmacyController: pharmacyController),
              ),
            )
          ],
        ),
      ),
    );
  }
}

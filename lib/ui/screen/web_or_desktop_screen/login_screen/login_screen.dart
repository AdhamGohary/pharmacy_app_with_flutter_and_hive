import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pharmacy_app/model/sign_up_model/sign_up_model.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/main_screen/main_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/sign_up_screen/sign_up_screen.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/ui/widgets/custom_divider/custom_divider.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/ui/widgets/my_circle_avatar/my_circle_avatar.dart';
import 'package:pharmacy_app/utilits/functions/validation_functions/auth_validate.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  late Box myBox = Hive.box<SignUpModel>('userInfoAuth');

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.1 * getHeight(context: context)),
            child: MyCircleAvatar(
              maxRadius: 0.1 * getwidth(context: context),
              child: Image.asset('images/snake.jpg',),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.6 * getHeight(context: context)),
            child: Column(children: <Widget>[
              CustomTxtFormField(
                hintText: 'Email',
                obScure: false,
                maxLines: 1,
                ifBody: '',
                myKey: emailKey,
                regExpSource: '',
                textEditingController: emailController,
                autovalidateMode: AutovalidateMode.disabled,
                caseSensitive: true,
                keyBoardType: TextInputType.emailAddress,
                prefixWidget: const Icon(Icons.email),
              ),
              CustomDivider(
                  height: 0.03 * getHeight(context: context),
                  color: Colors.transparent),
              CustomTxtFormField(
                hintText: 'Password',
                obScure: true,
                maxLines: 1,
                ifBody: '',
                myKey: passwordKey,
                regExpSource: '',
                textEditingController: passwordController,
                autovalidateMode: AutovalidateMode.disabled,
                caseSensitive: true,
                keyBoardType: TextInputType.visiblePassword,
                prefixWidget: const Icon(Icons.password),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 0.02 * getHeight(context: context)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 0.09 * getwidth(context: context),
                    child: CustomBtn(
                      color: Colors.lightBlue,
                      height: 0.00022 * getHeight(context: context),
                      txt: 'Log in',
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 0.015 * getwidth(context: context)),
                      function: () { if(AuthValidate.logInValidate(
                        context: context,
                        emailKey: emailKey,
                        passwordKey: passwordKey,
                        myBox: myBox,
                        emailController: emailController,
                        passwordController: passwordController,
                      )){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MainScreen()));
                      }},
                      width: 0.5 * getwidth(context: context),
                    ),
                  ),
                  SizedBox(
                    width: 0.09 * getwidth(context: context),
                    child: CustomBtn(
                      color: Colors.teal,
                      height: 0.00022 * getHeight(context: context),
                      txt: 'Sign Up',
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 0.013 * getwidth(context: context)),
                      function: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration:
                              const Duration(milliseconds: 1000),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: const SignUpScreen(),
                            );
                          },
                        ));
                      },
                      width: 0.002 * getwidth(context: context),
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

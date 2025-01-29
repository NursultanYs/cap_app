import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/resource/app_assets.dart';
import 'package:cap_app/core/services/shared_prefs.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/auth/app_validators.dart';
import 'package:cap_app/features/auth/screens/sign_up_screen.dart';
import 'package:cap_app/features/auth/widgets/app_button.dart';
import 'package:cap_app/features/home/screens/main_screen.dart';
import 'package:cap_app/widgets/app_login_button.dart';
import 'package:flutter/material.dart';
import 'package:cap_app/features/auth/widgets/auth_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _prefs = SharedPrefs();
  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailValidator = EmailValidator(); 
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 28, bottom: 100, right: 13, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sign In",
              style: AppTextstyles.regular
                  .withFontSize(48)
                  .withColor(Colors.black)
                  .withFamily("Imprima"),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextAuthField(
                    title: "EMAIL",
                    size: 16,
                    color: const Color(0xFF2B4C59),
                    marginBottom: 28,
                    validator: emailValidator.getValidator(),
                    controller: _loginController,
                  ),
                  TextAuthField(
                    size: 16,
                    color: const Color(0xFF2B4C59),
                    title: "PASSWORD",
                    marginBottom: 12,
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 34),
                    child: Text(
                      "Forgot password?",
                      style: AppTextstyles.regular
                          .withFamily("Inter")
                          .withFontSize(11),
                    ),
                  ),
                  LoginButton(
                    title: "Log in",
                    bkgColor: const Color(0xFF2b4c59),
                    fontWeight: FontWeight.w700,
                    textColor: Colors.white,
                    marginBottom: 9,
                    formKey: _formKey,
                    prefs: _prefs,
                    onTap: (
                      p,
                      prefs,
                      title,
                    ) async {
                      final login = await prefs.read(key: StorageKey.login);
                      final password =
                          await prefs.read(key: StorageKey.password);
                      if (login.toLowerCase() ==
                              _loginController.text.toLowerCase() &&
                          password == _passwordController.text) {
                        Fluttertoast.showToast(
                          msg: "Success",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Invalid password or Email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    child: Text(
                      "OR",
                      style: AppTextstyles.light.withFamily("Inter"),
                    ),
                  ),
                  const AuthButton(
                    imageLogo: AppAssets.googleLogo,
                    buttonText: "Continue With Google",
                    marginBottom: 13,
                    paddingRight: 61,
                  ),
                  const AuthButton(
                    imageLogo: AppAssets.facebook,
                    buttonText: "Continue With Facebook",
                    marginBottom: 52,
                    paddingRight: 44,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Don’t Have an account yet?",
                        style: AppTextstyles.light
                            .withFamily("Inter")
                            .withFontSize(15),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 33),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (const SignUp())));
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Color(0xFFfcc21b),
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

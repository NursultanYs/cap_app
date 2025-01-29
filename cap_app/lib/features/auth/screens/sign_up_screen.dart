import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/resource/app_assets.dart';
import 'package:cap_app/core/services/shared_prefs.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/auth/app_validators.dart';
import 'package:cap_app/features/auth/screens/sign_in_screen.dart';
import 'package:cap_app/features/auth/widgets/app_button.dart';
import 'package:cap_app/widgets/app_login_button.dart';
import 'package:flutter/material.dart';
import 'package:cap_app/features/auth/widgets/auth_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

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
    final nameValidator = NameValidator();
    final passValidator = PasswordValidatr();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 28, bottom: 60, right: 13, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sign Up",
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
                    title: "FULL NAME",
                    size: 16,
                    color: const Color(0xFF2B4C59),
                    marginBottom: 18,
                    validator: nameValidator.getValidator(),
                    controller: _nameController,
                  ),
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
                    marginBottom: 38,
                    obscureText: true,
                    validator: passValidator.getValidator(),
                    controller: _passwordController,
                  ),
                  LoginButton(
                    title: "Sign Up",
                    bkgColor: const Color(0xFF2b4c59),
                    fontWeight: FontWeight.w700,
                    textColor: Colors.white,
                    marginBottom: 9,
                    loginController: _loginController,
                    passController: _passwordController,
                    nameController: _nameController,
                    formKey: _formKey,
                    onTap:
                        (nameController, loginController, passwordController) {
                      if (nameController != null) {
                        _prefs.save(
                            key: StorageKey.name, value: _nameController.text);
                        // print("Записал");
                      }
                      if (loginController != null) {
                        _prefs.save(
                            key: StorageKey.login,
                            value: _loginController.text);
                        // print("Записал");
                      }
                      if (passwordController != null) {
                        _prefs.save(
                            key: StorageKey.password,
                            value: passwordController.text);
                        // print("Записла");
                        // print(_prefs);
                      }
                      if (loginController == null ||
                          passwordController == null) {}
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
                    marginBottom: 42,
                    paddingRight: 44,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Have an account Already?",
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
                                    builder: (context) => (const SignIn())));
                          },
                          child: const Text(
                            "SIGN IN",
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

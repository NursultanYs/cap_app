import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/resource/app_assets.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/auth/app_validators.dart';
import 'package:cap_app/features/auth/widgets/app_button.dart';
import 'package:cap_app/widgets/app_login_button.dart';
import 'package:flutter/material.dart';
import 'package:cap_app/features/auth/widgets/auth_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final emailValidator = EmailValidator(); // Создание экземпляра валидатора
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
                    title: "EMAIL OR PHONE",
                    size: 16,
                    color: const Color(0xFF2B4C59),
                    marginBottom: 28,
                    validator: emailValidator.getValidator(),
                  ),
                  TextAuthField(
                    size: 16,
                    color: const Color(0xFF2B4C59),
                    title: "PASSWORD",
                    marginBottom: 12,
                    obscureText: true,
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
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Color(0xFFfcc21b),
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 13),
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

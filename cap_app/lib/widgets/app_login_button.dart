import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Color bkgColor;
  final FontWeight fontWeight;
  final Color textColor;
  final double marginBottom;
  final GlobalKey<FormState> formKey;
  final Function(dynamic, dynamic, dynamic?)? onTap;
  final TextEditingController? loginController;
  final TextEditingController? passController;
  final TextEditingController? nameController;
  final dynamic prefs;
  const LoginButton(
      {super.key,
      required this.title,
      required this.bkgColor,
      required this.fontWeight,
      required this.textColor,
      required this.marginBottom,
      required this.formKey,
      this.onTap,
      this.loginController,
      this.passController,
      this.nameController,
      this.prefs});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      margin: EdgeInsets.only(bottom: marginBottom),
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(bkgColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print("Validation successful!");
              if (loginController != null &&
                  passController != null &&
                  nameController != null) {
                onTap!(nameController, loginController, passController);
              } else {
                onTap!(null, prefs, null);
              }
            } else {}
          },
          child: Text(
            title,
            style: TextStyle(
                fontWeight: fontWeight,
                color: textColor,
                fontSize: 20,
                fontFamily: "Inter"),
          )),
    );
  }
}

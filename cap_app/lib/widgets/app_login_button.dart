import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Color bkgColor;
  final FontWeight fontWeight;
  final Color textColor;
  final double marginBottom;
  final GlobalKey<FormState> formKey;
  const LoginButton({
    super.key,
    required this.title,
    required this.bkgColor,
    required this.fontWeight,
    required this.textColor,
    required this.marginBottom,
    required this.formKey,
  });

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

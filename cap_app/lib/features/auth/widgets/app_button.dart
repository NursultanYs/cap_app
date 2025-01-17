import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String imageLogo;
  final String buttonText;
  final double marginBottom;
  final double paddingRight;
  const AuthButton({
    super.key,
    required this.imageLogo,
    required this.buttonText,
    required this.marginBottom,
    required this.paddingRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: EdgeInsets.only(bottom: marginBottom),
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            )),
          ),
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(45, 0, paddingRight, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imageLogo,
                  width: 30,
                  height: 30,
                ),
                Text(buttonText,
                    style: AppTextstyles.regular
                        .withFontSize(17)
                        .withFamily("Imprima")
                        .withColor(Colors.black))
              ],
            ),
          )),
    );
  }
}

import 'package:cap_app/features/auth/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/core/extensensions/textStyle_extension.dart';

class TextAuthField extends StatefulWidget {
  final double size;
  final Color color;
  final String title;
  final double marginBottom;
  bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  TextAuthField({
    super.key,
    required this.size,
    required this.color,
    required this.title,
    required this.marginBottom,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  State<TextAuthField> createState() => _textAuthFieldState();
}

class _textAuthFieldState extends State<TextAuthField> {
  late bool visible = widget.obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 0),
            child: Text(
              widget.title,
              style: AppTextstyles.regular
                  .withFontSize(widget.size)
                  .withColor(widget.color),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 26),
          child: Container(
            margin: EdgeInsets.only(bottom: widget.marginBottom),
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              obscureText: visible,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFe5e5e5),
                    width: 2,
                  ),
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFe5e5e5),
                    width: 2,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFe5e5e5),
                    width: 2,
                  ),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFe5e5e5),
                    width: 2,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFe5e5e5),
                    width: 2,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                isDense: true,
                suffixIcon: widget.obscureText
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: Icon(
                            visible ? Icons.visibility_off : Icons.visibility))
                    : null,
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30,
                  maxWidth: 30,
                ),
              ),
              style: AppTextstyles.regular
                  .withFontSize(16)
                  .withColor(const Color(0xFFa1a1a1))
                  .withFamily("Roboto"),
            ),
          ),
        )
      ],
    );
  }
}

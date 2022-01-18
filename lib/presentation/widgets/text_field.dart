import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldInput extends StatelessWidget {
  final String hint;
  const TextFieldInput({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15.0.sp),
      decoration: InputDecoration(
        fillColor: Colors.white.withAlpha(10),
        hintStyle: const TextStyle(fontWeight: FontWeight.normal),
        hintText: hint,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: false,
    );
  }
}

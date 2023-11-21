import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextFormField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isEnabled;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final bool isTopBorder;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final FocusNode? focusNode;

  const CTextFormField(
      {Key? key,
      this.title,
      this.hintText,
      this.errorText,
      this.validator,
      this.prefixIcon,
      this.controller,
      this.autofocus = true,
      this.onFieldSubmitted,
      this.textInputAction,
      this.maxLines = 1,
      this.obscureText = false,
      this.isEnabled = true,
      this.inputFormatter,
      this.focusNode,
      this.isTopBorder = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      style: const TextStyle(color: Colors.black),
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatter,
      obscureText: obscureText,
      maxLines: maxLines,
      autofocus: autofocus,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: title,
        hintText: hintText,
        errorText: errorText,
        errorMaxLines: 5,
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: customOutlineInputBorder(Colors.black, isTopBorder),
        disabledBorder: customOutlineInputBorder(Colors.grey, isTopBorder),
        focusedBorder: customOutlineInputBorder(Colors.black, isTopBorder),
        errorBorder: customOutlineInputBorder(Colors.red, isTopBorder),
        focusedErrorBorder: customOutlineInputBorder(Colors.red, isTopBorder),
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: prefixIcon,
      ),
    );
  }
}

InputBorder? customOutlineInputBorder(Color borderColor, bool isTopBorder) {
  return OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: borderColor),
    borderRadius: isTopBorder
        ? BorderRadius.circular(8)
        : const BorderRadius.only(
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
  );
}

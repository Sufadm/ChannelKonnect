import 'package:flutter/material.dart';
import 'package:nowapps/model/utils/styles/textstyles.dart';

class Textform extends StatelessWidget {
  final TextInputType? keyboardType;
  final int? maxLength;
  final VoidCallback onTap;
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final bool enabled;
  final bool autocorrect;
  final bool autofocus;
  final bool readOnly;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final bool? autofocusNext;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onSuffixTap;
  final Widget? suffixIcon;

  const Textform({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLength,
    required this.onTap,
    this.maxLines,
    this.validator,
    this.contentPadding,
    this.obscureText = false,
    this.enabled = true,
    this.autocorrect = true,
    this.autofocus = false,
    this.readOnly = false,
    this.style,
    this.textAlign,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.autofocusNext,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSuffixTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      onTap: onTap,
      keyboardType: keyboardType,
      maxLength: maxLength,
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      autocorrect: autocorrect,
      autofocus: autofocus,
      readOnly: readOnly,
      style: style,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: latoB,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: contentPadding,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: onSuffixTap,
              )
            : null,
      ),
    );
  }
}

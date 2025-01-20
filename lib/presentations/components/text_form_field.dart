import 'package:flutter/services.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput(
      {this.controller,
      this.hintText,
      this.suffixIcon,
      this.filledColor = false,
      this.validator,
      this.obsecure = false,
      this.filled = true,
      this.onChanged,
      this.maxLength,
      this.inputFormatters,
      this.keyboardType,
      this.maxLines,
      this.minLines,
      Key? key})
      : super(key: key);

  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final TextEditingController? controller;
  final String? hintText;
  final bool filledColor;
  final Widget? suffixIcon;
  final bool filled;
  final void Function(String)? onChanged;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: (15), right: (15)),
          errorMaxLines: 4,
          errorStyle: textstyle.copyWith(color: redcolor, fontSize: (12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: plightcolor.withOpacity(0.5)),
            borderRadius: const BorderRadius.all(Radius.circular((7))),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular((7))),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular((7))),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: plightcolor.withOpacity(0.2)),
            borderRadius: const BorderRadius.all(Radius.circular((7))),
          ),
          hintText: hintText,
          fillColor: filled
              ? (filledColor)
                  ? redlightcolor
                  : plightcolor.withOpacity(0.02)
              : whitecolor,
          filled: true,
          suffixIcon: suffixIcon),
      validator: validator,
      obscureText: obsecure,
      onChanged: onChanged,
      cursorColor: primarycolor,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
    );
  }
}

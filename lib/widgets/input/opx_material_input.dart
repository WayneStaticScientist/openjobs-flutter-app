import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/utils/themer_util.dart';

class OpenXInput extends StatefulWidget {
  final Icon? leadingIcon;
  final String hint;
  final int? minLines;
  final int? maxLines;
  final bool? enabled;
  final Widget? suffix;
  final bool? passwordField;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validate;
  final TextEditingController? controller;
  const OpenXInput({
    super.key,
    this.leadingIcon,
    required this.hint,
    this.controller,
    this.validate,
    this.keyboardType,
    this.maxLines,
    this.suffix,
    this.minLines,
    this.enabled,
    this.passwordField,
  });

  @override
  State<OpenXInput> createState() => _OpenXInputState();
}

class _OpenXInputState extends State<OpenXInput> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      enabled: widget.enabled ?? true,
      validator: widget.validate,
      controller: widget.controller,
      obscureText: (widget.passwordField ?? false) && !_showPassword,
      decoration: InputDecoration(
        prefixIcon: widget.leadingIcon,
        hint: Text(widget.hint),
        filled: true,
        suffixIcon: widget.passwordField == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                icon: Icon(
                  !_showPassword
                      ? LineAwesomeIcons.eye_solid
                      : LineAwesomeIcons.eye_slash_solid,
                ),
              )
            : widget.suffix,
        fillColor: Colors.grey.withAlpha(26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: ThemerUtil.getPaint()),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
    );
  }
}

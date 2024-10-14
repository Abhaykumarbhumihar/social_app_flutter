import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive/screenUtils.dart';

class CustomTextInputMobile extends StatefulWidget {
  final String title;
  final bool isPass;
  final bool isSuffix;
  final bool? isFocus;
  final hint;
  final readOnly;
  final onTap;
  final inputFormatters;
  final suffixIcon;
  final isDOllar;
  final keyBoardType;
  final onFieldSubmitted;
  final maxLength;
  final autovalidateMode;
  final validator;
  final onChanged;
  final focusNode;

  final TextEditingController? controller;

  const CustomTextInputMobile({
    required this.title,
    required this.isPass,
    required this.isSuffix,
    this.hint,
    this.validator,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.onChanged,
    this.focusNode,
    this.inputFormatters,
    this.isDOllar = false,
    this.isFocus = false,
    this.readOnly,
    this.onTap,
    this.maxLength,
    this.keyBoardType,
    this.suffixIcon,
    this.controller,
  });

  @override
  State<CustomTextInputMobile> createState() => _CustomTextInputMobileState();
}

class _CustomTextInputMobileState extends State<CustomTextInputMobile> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var width = ScreenUtils.width(context);
    var height = ScreenUtils.height(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: ScreenUtils.width(context) * 0.015, bottom: 4.0),
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins Medium',
                fontSize: ScreenUtils.width(context) * 0.035),
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            TextFormField(

              autofocus: widget.isFocus ?? false,
              textCapitalization: TextCapitalization.sentences,
              onChanged: widget.onChanged ?? (val) {},
              cursorColor: Colors.black26,
              autovalidateMode: widget.title == 'Email'
                  ? widget.autovalidateMode
                  : AutovalidateMode.disabled ?? AutovalidateMode.disabled,
              maxLength: widget.maxLength,
              validator: widget.title == 'Email'
                  ? widget.validator
                  : null ??
                      (val) {
                        return null;
                      },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: widget.onFieldSubmitted,
              keyboardType: widget.keyBoardType,
              onTap: widget.onTap ?? () {},
              focusNode: widget.focusNode,
              inputFormatters: widget.inputFormatters,
              controller: widget.controller ?? TextEditingController(),
              readOnly: widget.readOnly ?? false,
              obscureText: widget.isPass == true ? _obscureText : false,
              decoration: InputDecoration(
                counter: SizedBox(),
                contentPadding: EdgeInsets.only(
                    left: widget.isDOllar == true ? width * 0.04 : width * 0.03,
                    top: width * 0.04,
                    bottom: width * 0.04,
                    right: width * 0.04),
                suffixIcon: widget.isSuffix == true
                    ? widget.suffixIcon ??
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: sufixs(context, _obscureText, width),
                        )
                    : const SizedBox(),
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hint ?? widget.title,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontFamily: 'Poppins Regular',
                    fontSize: ScreenUtils.width(context) * 0.03),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.black26),
                ),
              ),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtils.width(context) * 0.03,
                  fontFamily: 'Poppins Regular'),
            ),
            widget.isDOllar == false
                ? SizedBox(
                    height: 0,
                    width: 0,
                  )
                : Text(
                    '\$',
                    style: TextStyle(color: Colors.black),
                  )
          ],
        ),
      ],
    );
  }

  sufixs(context, _obscureText, width) {
    if (widget.title == "Password" ||
        widget.title == "Old Password" ||
        widget.title == "New Password" ||
        widget.title == "Confirm Password" ||
        widget.title == "Current Password") {
      return Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: Colors.blueAccent,
        size: width * 0.04,
      );
    } else if (widget.title == "Email") {
      return Icon(
        Icons.email_outlined,
        color: Colors.blueAccent,
        size: width * 0.04,
      );
    } else if (widget.title == "Phone" || widget.title == "Phone number") {
      return Icon(
        Icons.phone,
        color: Colors.blueAccent,
        size: width * 0.04,
      );
    } else {
      return Icon(CupertinoIcons.person_circle_fill,
          color: Colors.blueAccent, size: width * 0.04);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/styles/text_theme.dart';

class SearchInputField extends StatelessWidget {
  final bool isPassword;
  final bool obscureText;
  final String? label;
  final String hint;
  final TextEditingController controller;
  final Function? onTap;
  final Function? onDone;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final bool isRequired;
  final bool? readOnly;
  final bool? isDoB;
  final String? error;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;
  final int? lines;
  final bool? hintBold;

  const SearchInputField(
      {Key? key,
      this.width,
      this.height,
      this.isPassword = false,
      this.obscureText = false,
      this.label,
      required this.hint,
      required this.controller,
      this.onTap,
      this.inputType,
      this.onChanged,
      this.isRequired = true,
      this.suffixIcon,
      this.prefixIcon,
      this.error,
      this.readOnly,
      this.lines,
      this.decoration,
      this.padding,
      this.textInputAction,
      this.onDone,
      this.hintBold,
      this.isDoB})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyling.mediumRegular
                .copyWith(color: AppColors.black, fontSize: 16.sp),
          ),
        Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 56.h,
          decoration: decoration ??
              BoxDecoration(
                color: AppColors.grey.withOpacity(0.5),
                border: Border.all(
                  color: AppColors.appPrimary,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              prefixIcon ?? SizedBox.shrink(),
              Expanded(
                child: Center(
                  child: TextFormField(
                    onTap: () {
                      onTap!();
                    },
                    textInputAction: textInputAction ?? TextInputAction.next,
                    keyboardType: inputType ?? TextInputType.text,
                    validator: (val) {
                      bool emailValid = true;
                      bool passwordValid = true;
                      if (inputType == TextInputType.emailAddress) {
                        emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(controller.text);
                      }
                      // if (isPassword) {
                      //   passwordValid = RegExp(
                      //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //       .hasMatch(controller.text);
                      // }

                      if (isPassword) {
                        if ((val?.length ?? 0) < 8) {
                          passwordValid = false;
                        }
                      }
                      return isRequired
                          ? (val!.isEmpty)
                              ? error
                              : (emailValid == false)
                                  ? "enter valid email"
                                  : (passwordValid == false)
                                      ? "password must be at least 8 characters"
                                      : null
                          : null;
                    },
                    onChanged: (val) {
                      onChanged!(val);
                    },
                    controller: controller,
                    readOnly: readOnly ?? false,
                    obscureText: obscureText,
                    onFieldSubmitted: (val) {
                      onDone!();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorStyle: TextStyling.smallRegular
                          .copyWith(color: AppColors.red),
                      errorMaxLines: 1,
                      hintText: hint,
                      hintStyle: TextStyling.mediumRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black.withOpacity(0.5)),
                      hintMaxLines: 1,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    ),
                    cursorColor: AppColors.primary,
                    cursorHeight: 20,
                    style: TextStyling.mediumRegular
                        .copyWith(color: AppColors.black),
                  ),
                ),
              ),
              suffixIcon ?? SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
  }
}

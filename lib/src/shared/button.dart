import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/styles/text_theme.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;

  final Function onTap;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;

  final bool isPrimary;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  const MainButton(
      {Key? key,
      required this.text,
      this.width,
      this.height,
      required this.onTap,
      this.margin,
      this.bgColor,
      this.borderColor,
      this.textColor,
      this.borderRadius,
      required this.isPrimary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 52.h,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(50),
          color: bgColor ??
              ((isPrimary == true) ? AppColors.secondary : Colors.transparent),
          border: Border.all(color: borderColor ?? AppColors.white),
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        margin: margin,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyling.mediumRegular.copyWith(
              color: textColor ?? AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

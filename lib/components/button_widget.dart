import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/utils/app_colors.dart';


class ButtonWidget extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;
  final String? icon;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const ButtonWidget({Key? key,
    required this.title,
    this.width,
    this.height,
    this.radius,
    this.margin,
    this.icon,
    this.buttonColor,
    this.textStyle,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        width: width ?? double.infinity,
        height: height ?? 45.h,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.themeColorOrange,
          borderRadius: BorderRadius.circular(radius ?? 30.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0.5, 1)
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: textStyle ?? TextStyle(
                  fontSize: 16.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

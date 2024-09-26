import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {

  final TextInputType? inputType;
  final String? title;
  final String? initialValue;
  final bool? isPasswordHide;
  final bool? isEnabled;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const TextFieldWidget({Key? key,this.inputType,required this.title,this.initialValue,this.isPasswordHide,this.isEnabled,this.readOnly,this.validator,this.onChanged,this.onTap,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      enabled: isEnabled,
      readOnly: readOnly ?? false,
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: isPasswordHide ?? false,
      keyboardType: inputType ?? TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
        hintText: title,
        isDense:false,
        contentPadding: EdgeInsets.only(left: 15.w),
        hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2, color:AppColors.themeColorBlue),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../app/utils/app_colors.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_routes.dart';
import '../app/utils/app_strings.dart';
import '../app/utils/app_toast.dart';
import '../components/app_bar_widget.dart';
import '../controllers/login_register_controller.dart';
import '../data/arguments/register_args.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final controller = Get.put(LoginRegisterController());
  late RegisterArgs registerArgs;


  @override
  void initState() {
    registerArgs = Get.arguments;
    controller.userId.value=registerArgs.userId.toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppToast.showMessage('Your Otp is ${registerArgs.otp.toString()}');
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120), // Set this height
            child: AppBarWidget()),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Verification',
                  style: TextStyle(
                      height: 1.4,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff25011B)),
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                'OTP has been sent to your Email',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 63.h),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 45,
                otpFieldStyle: OtpFieldStyle(
                    backgroundColor: const Color(0xffF9F9F9),
                    borderColor: AppColors.themeColorBlue,
                    enabledBorderColor:Colors.grey,
                    focusBorderColor: AppColors.themeColorBlue),
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textFieldAlignment: MainAxisAlignment.center,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 6.r,
                onCompleted: (pin) {
                  verifyOtp(pin);
                },
              ),
              SizedBox(height: 47.h),
              // ButtonWidget(title: 'Submit', onPressed: (){
              //
              // }),
              // SizedBox(height: 30.h),
              RichText(text: TextSpan(text: 'Didn\'t get it? ',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = (){
                        resendOtp();
                      },
                      text: 'Resend',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeColorBlue,
                          decoration: TextDecoration.underline
                      ),
                    )
                  ]
              ))
            ],
          ),
        ),
      ),
    );
  }

  void verifyOtp(String pin) {
    controller.verifyOtp(pin,controller.userId.value).then((response){
      if(response.isSuccess()){
        AppPreference.setString(AppStrings.authToken, response.data().response?.accessToken.toString());
        AppPreference.setString(AppStrings.userId, response.data().response?.id.toString());
        Get.offAllNamed(AppRoutes.home);
        AppToast.showMessage(response.data().message.toString());
      }else{
        AppToast.showMessage(response.error());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void resendOtp() {
    controller.register().then((response) {
      if (response.isSuccess()) {
        controller.userId.value=response.data().response?.id.toString();
        AppToast.showMessage('Your Otp is ${response.data().response?.otp}');
      } else {
        AppToast.showMessage(response.error());
      }
    });
  }

}

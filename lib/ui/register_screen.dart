import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';
import 'package:starlinex_courier/app/utils/app_routes.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/data/arguments/register_args.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_strings.dart';
import '../app/utils/app_toast.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';
import '../controllers/login_register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.put(LoginRegisterController());
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
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
          body: Obx(() => ModalProgressHUD(
                inAsyncCall: controller.mLoading.value,
                child: Padding(
                  padding: EdgeInsets.all(40.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Name';
                                  } else {
                                    controller.name.value = value;
                                  }
                                },
                                title: 'Name',
                                inputType: TextInputType.text,
                              ),
                              SizedBox(height: 27.h),
                              TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Email';
                                  } else if (!GetUtils.isEmail(
                                      value.toString())) {
                                    return 'Please Enter Valid Email';
                                  }else {
                                    controller.email.value = value;
                                  }
                                },
                                title: 'Email',
                                inputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 27.h),
                              TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Phone';
                                  }else if (!GetUtils.isPhoneNumber(
                                      value.toString())) {
                                    return 'Please Enter Valid Phone';
                                  } else {
                                    controller.phone.value = value;
                                  }
                                },
                                title: 'Phone',
                                inputType: TextInputType.phone,
                              ),
                              SizedBox(height: 27.h),
                              TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Password';
                                  }else if (GetUtils.isLengthLessThan(value.toString(),6)) {
                                    return 'Please Enter Minimum 6 Character';
                                  }  else {
                                    controller.password.value = value;
                                  }
                                },
                                isPasswordHide: true,
                                title: 'Password',
                                inputType: TextInputType.text,
                              ),
                              SizedBox(height: 27.h),
                              TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Password';
                                  } else if (controller.password.value != value) {
                                    return 'Password Mismatch';
                                  } else {
                                    controller.password.value = value;
                                  }
                                },
                                isPasswordHide: true,
                                title: 'Confirm Password',
                                inputType: TextInputType.text,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                        ButtonWidget(
                          title: 'Register',
                          onPressed: () {
                            register();
                          },
                        ),
                        SizedBox(height: 30.h),
                        RichText(
                            text: TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.back(),
                                text: 'Login',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.themeColorBlue,
                                    decoration: TextDecoration.underline),
                              )
                            ]))
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      controller.mLoading.value = true;
      controller.register().then((response) {
        if (response.isSuccess()) {
          // AppPreference.setString(AppStrings.authToken, response.data().response?.accessToken.toString());
          // AppPreference.setString(AppStrings.userId, response.data().response?.id.toString());
          controller.mLoading.value = false;
          var args = RegisterArgs(
              userId: response.data().response?.id.toString(),
              otp: response.data().response?.otp.toString(),
              name: controller.name.value,
              phone: controller.phone.value,
              email: controller.email.value,
              password: controller.password.value);
          Get.toNamed(AppRoutes.otpVerify, arguments: args);
        } else {
          controller.mLoading.value = false;
          AppToast.showMessage(response.error());
        }
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';
import 'package:starlinex_courier/app/utils/app_routes.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/login_register_controller.dart';
import 'package:starlinex_courier/ui/forgot_password_dialog.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_strings.dart';
import '../app/utils/app_toast.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final controller = Get.put(LoginRegisterController());
  final GlobalKey<FormState> formKey=GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(120), // Set this height
              child: AppBarWidget()
          ),
          body:Obx(() => ModalProgressHUD(
            inAsyncCall: controller.mLoading.value,
            child: Padding(
              padding:
              EdgeInsets.all(40.r),
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
                              return 'Enter Email';
                            } else {
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
                              return 'Enter Password';
                            } else {
                              controller.password.value = value;
                            }
                          },
                          isPasswordHide: true,
                          title: 'Password',
                          inputType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (child) {
                              return ForgotPasswordDialog();
                            });
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 4),
                                blurRadius: 5.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ],
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.themeColorBlue),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ButtonWidget(
                    title: 'Login',
                    onPressed: () {
                      // Get.offAllNamed(AppRoutes.home);
                      loginUser();
                    },
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'OR',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: 30.h),
                  ButtonWidget(
                    title: 'Create Account',
                    onPressed: () {
                      Get.toNamed(AppRoutes.register);
                    },
                  ),
                  SizedBox(height: 28.h),
                ],
              ),
            ),
          ))
      ),
    );
  }

  void loginUser() {
    if (formKey.currentState!.validate()) {
      controller.mLoading.value = true;
      controller.emailLogin().then((response) {
        if (response.isSuccess()) {
          AppPreference.setString(AppStrings.authToken, response.data().response?.accessToken.toString());
          AppPreference.setString(AppStrings.userId, response.data().response?.id.toString());
          controller.mLoading.value = false;
          Get.offAllNamed(AppRoutes.home);
        } else {
          controller.mLoading.value = false;
          AppToast.showMessage(response.error());
        }
      });
    }
  }


}

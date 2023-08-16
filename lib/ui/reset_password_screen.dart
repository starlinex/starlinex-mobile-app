import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';
import 'package:starlinex_courier/app/utils/app_routes.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/login_register_controller.dart';
import 'package:starlinex_courier/ui/forgot_password_dialog.dart';
import '../app/utils/app_toast.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';
import '../data/arguments/register_args.dart';

class ResetPasswordScreen extends StatefulWidget {

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final controller = Get.put(LoginRegisterController());
  final GlobalKey<FormState> formKey=GlobalKey();
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
                              return 'Enter OTP';
                            } else {
                              controller.otp.value = value;
                            }
                          },
                          title: 'Enter OTP',
                          inputType: TextInputType.number,
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
                  SizedBox(height: 30.h),
                  ButtonWidget(
                    title: 'Submit',
                    onPressed: () {
                      resetPassword();
                    },
                  ),
                ],
              ),
            ),
          ))
      ),
    );
  }

  void resetPassword() {
    if(formKey.currentState!.validate()){
      controller.mLoading.value=true;
      controller.resetPassword().then((response){
        if(response.isSuccess()){
          controller.mLoading.value=false;
          Get.offAllNamed(AppRoutes.login);
          AppToast.showMessage(response.data().message.toString());
        }else{
          controller.mLoading.value=false;
          AppToast.showMessage(response.error());
        }
      });
    }
  }

}

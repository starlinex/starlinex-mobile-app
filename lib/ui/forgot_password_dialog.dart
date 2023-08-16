import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_routes.dart';
import '../app/utils/app_toast.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';
import '../controllers/login_register_controller.dart';
import '../data/arguments/register_args.dart';

class ForgotPasswordDialog extends StatelessWidget {
  ForgotPasswordDialog({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  final controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 20.h, bottom: 30.h),
                width: 300.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 0.4,
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            width: double.infinity,
                            child: const Icon(Icons.close))),
                    SizedBox(height: 20.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Email';
                              } else {
                                controller.email.value = value;
                              }
                            },
                            onChanged: (value){
                              controller.email.value = value;
                            },
                            title: 'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      alignment: Alignment.center,
                      child: ButtonWidget(
                          title: 'Submit',
                          onPressed: () {
                            forgetPassword();
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void forgetPassword() {
    print('EMial=>${controller.email.value}');
    if (_formKey.currentState!.validate()) {
      controller.forgetPassword().then((response) {
        if (response.isSuccess()) {
          var args = RegisterArgs(
              userId: response.data().response?.id.toString(),
              otp: response.data().response?.otp.toString());
          Get.toNamed(AppRoutes.resetPassword,arguments: args);
        } else {
          AppToast.showMessage(response.error());
        }
      });
    }
  }

}

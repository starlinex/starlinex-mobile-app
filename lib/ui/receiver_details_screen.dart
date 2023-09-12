import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/receiver_details_controller.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';

class ReceiverDetailsScreen extends StatefulWidget {
  const ReceiverDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ReceiverDetailsScreen> createState() => _ReceiverDetailsScreenState();
}

class _ReceiverDetailsScreenState extends State<ReceiverDetailsScreen> {
  var controller = Get.put(ReceiverDetailsController());
  final formKey = GlobalKey<FormState>();

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
              child: AppBarWidget(
                isBackEnable: true,
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(40.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'CONSIGNEE / RECEIVER ',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 40.h),
                            ],
                          ),
                        ),
                        Text(
                          'Search Address Book',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Search';
                            } else {
                              controller.search.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.search.value = value;
                          },
                          title: 'Search Address Book',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Company',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Company';
                            } else {
                              controller.company.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.company.value = value;
                          },
                          title: 'Enter Company',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Person Name',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Person Name';
                            } else {
                              controller.personName.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.personName.value = value;
                          },
                          title: 'Enter Person Name',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Address 1',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Address';
                            } else {
                              controller.address1.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.address1.value = value;
                          },
                          title: 'Enter Address',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Address 2',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Enter Address';
                          //   } else {
                          //     controller.address2.value = value;
                          //   }
                          // },
                          onChanged: (value) {
                            controller.address2.value = value;
                          },
                          title: 'Enter Address',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Address 3',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Enter Address';
                          //   } else {
                          //     controller.address3.value = value;
                          //   }
                          // },
                          onChanged: (value) {
                            controller.address3.value = value;
                          },
                          title: 'Enter Address',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Post / Zip Code',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Post / Zip Code';
                            } else {
                              controller.postCode.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.postCode.value = value;
                          },
                          title: 'Enter Post / Zip Code',
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'City',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter City';
                            } else {
                              controller.city.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.city.value = value;
                          },
                          title: 'Enter City',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'State / County',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter State / County';
                            } else {
                              controller.state.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.state.value = value;
                          },
                          title: 'Enter State / County',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Country',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Obx(() => TextFieldWidget(
                              key: Key(controller.countryValue.value),
                              initialValue: controller.countryValue.value,
                              onTap: () {
                                controller.showCountryList(context);
                              },
                              readOnly: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Choose Country';
                                }
                              },
                              title: 'Choose Country',
                              inputType: TextInputType.text,
                            )),
                        SizedBox(height: 27.h),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Obx(() => Expanded(
                                  flex: 3,
                                  child: TextFieldWidget(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Code';
                                      }
                                    },
                                    key: Key(controller.countryCode.value),
                                    initialValue: controller.countryCode.value,
                                    readOnly: true,
                                    title: 'Code',
                                    inputType: TextInputType.number,
                                  ),
                                )),
                            SizedBox(width: 10.w),
                            Expanded(
                              flex: 9,
                              child: TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Phone Number';
                                  } else {
                                    controller.phone.value = value;
                                  }
                                },
                                onChanged: (value) {
                                  controller.phone.value = value;
                                },
                                title: 'Enter Phone Number',
                                inputType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Phone Number 2',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Obx(() => Expanded(
                                  flex: 3,
                                  child: TextFieldWidget(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Code';
                                      }
                                    },
                                    key: Key(controller.countryCode.value),
                                    initialValue: controller.countryCode.value,
                                    readOnly: true,
                                    title: 'Code',
                                    inputType: TextInputType.number,
                                  ),
                                )),
                            SizedBox(width: 10.w),
                            Expanded(
                              flex: 9,
                              child: TextFieldWidget(
                                onChanged: (value) {
                                  controller.phone2.value = value;
                                },
                                title: 'Enter Phone Number',
                                inputType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Email Address',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email Address';
                            } else {
                              controller.email.value = value;
                            }
                          },
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          title: 'Enter Email Address',
                          inputType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    title: 'Next',
                    onPressed: () {
                      controller.saveArgs();
                      if (formKey.currentState!.validate()) {
                        Get.toNamed(AppRoutes.weightDetails);
                      }
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          )),
    );
  }
}

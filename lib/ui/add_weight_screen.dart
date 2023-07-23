import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/add_weight_controller.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({Key? key}) : super(key: key);

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {

  var controller = Get.put(AddWeightController());
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
                                'ADD WEIGHT AND DIMENSION',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 40.h),
                            ],
                          ),
                        ),
                        Text(
                          'Actual WT.(KG.)',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Actual Weight';
                            } else {
                              controller.actualWeight.value = int.parse(value);
                            }
                          },
                          title: '',
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 27.h),
                        Obx(() =>
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'L(CM)',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5.h),
                                TextFieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter L(CM)';
                                    } else {
                                      controller.lcm.value = int.parse(value);
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.bcmReadOnly.value = false;
                                    } else {
                                      controller.bcmReadOnly.value = true;
                                    }
                                    controller.lcm.value = int.parse(value);
                                  },
                                  title: '',
                                  inputType: TextInputType.number,
                                ),
                                SizedBox(height: 27.h),
                                Text(
                                  'B(CM)',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5.h),
                                TextFieldWidget(
                                  readOnly: controller.bcmReadOnly.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter B(CM)';
                                    } else {
                                      controller.bcm.value = int.parse(value);
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.hcmReadOnly.value = false;
                                    } else {
                                      controller.hcmReadOnly.value = true;
                                    }
                                    controller.bcm.value = int.parse(value);
                                  },
                                  title: '',
                                  inputType: TextInputType.number,
                                ),
                                SizedBox(height: 27.h),
                                Text(
                                  'H(CM)',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5.h),
                                TextFieldWidget(
                                  readOnly: controller.hcmReadOnly.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter H(CM)';
                                    } else {
                                      controller.hcm.value = int.parse(value);
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.hcm.value = int.parse(value);
                                      controller.calculateVolumetricWeight();
                                    } else {
                                      controller.volumetricWeight.value = 0.0;
                                    }
                                  },
                                  title: '',
                                  inputType: TextInputType.number,
                                ),
                                SizedBox(height: 27.h),
                                Text(
                                  'Volumetric WT.(KG.)',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5.h),
                                TextFieldWidget(
                                  key: Key(controller.volumetricWeight.value
                                      .toString()),
                                  initialValue: controller.volumetricWeight
                                      .value.toString(),
                                  readOnly: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Volumetric';
                                    }
                                  },
                                  title: '0',
                                  inputType: TextInputType.number,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    title: 'Submit',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.saveArgs();
                        Get.back(result: controller.args.value);
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

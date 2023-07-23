import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starlinex_courier/app/utils/app_strings.dart';

import 'app/utils/app_preference.dart';
import 'app/utils/app_routes.dart';
import 'network/provider/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await AppPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String token=AppPreference.getString(AppStrings.authToken) ?? '';
    return ScreenUtilInit(
      designSize: const Size(360,800),
      minTextAdapt: false,
      builder: (BuildContext context, Widget? child) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          builder: (context,child){
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1),child: child!);
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: token.isNotEmpty?AppRoutes.home:AppRoutes.splash,
          getPages: getPages,
        );
      },
    );
  }
}


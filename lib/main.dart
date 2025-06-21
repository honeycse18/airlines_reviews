import 'package:airlines_review/controllers/home_controller.dart';
import 'package:airlines_review/utils/app_page_names.dart';
import 'package:airlines_review/utils/app_pages.dart';
import 'package:airlines_review/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 892),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Airlines Review',
          theme: AppThemeData.appThemeData,
          getPages: AppPages.pages,
          unknownRoute: AppPages.unknownScreenPageRoute,
          initialRoute: AppPageNames.rootScreen,
        );
      },
    );
  }
}

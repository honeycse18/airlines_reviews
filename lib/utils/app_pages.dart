import 'package:airlines_review/main.dart';
import 'package:airlines_review/screens/auth/auth.dart';
import 'package:airlines_review/screens/unknown.dart';
import 'package:airlines_review/screens/wrapper.dart';
import 'package:airlines_review/utils/app_page_names.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: AppPageNames.rootScreen, page: () => const WrapperScreen()),
    GetPage(name: AppPageNames.auth, page: () => const Auth()),
  ];

  static final GetPage<dynamic> unknownScreenPageRoute = GetPage(
    name: AppPageNames.unknownScreen,
    page: () => const UnknownScreen(),
  );
}

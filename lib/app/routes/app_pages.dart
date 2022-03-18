import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hometab/bindings/hometab_binding.dart';
import '../modules/hometab/views/hometab_view.dart';
import '../modules/publish/bindings/publish_binding.dart';
import '../modules/publish/views/publish_view.dart';
import '../modules/shopping/bindings/shopping_binding.dart';
import '../modules/shopping/views/shopping_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PUBLISH,
      page: () => PublishTabView(),
      binding: PublishBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPING,
      page: () => ShoppingTabView(),
      binding: ShoppingBinding(),
    ),
    GetPage(
      name: _Paths.HOMETAB,
      page: () => HomeTabView(),
      binding: HomeTabBinding(),
    ),
  ];
}

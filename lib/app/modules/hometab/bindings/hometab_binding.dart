import 'package:get/get.dart';

import '../controllers/hometab_controller.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTabController>(
      () => HomeTabController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:get_x_template/app/data/repository/api_repository_impl.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut(() => ApiRepositoryImpl());
  }
}

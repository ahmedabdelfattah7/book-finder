import 'package:book_finder/features/presentation/controller/home_controller.dart';
import 'package:book_finder/features/services/app_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppService());
    Get.put(HomeController());
  }
}

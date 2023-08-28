import 'package:get/get.dart';

import '../home/domain/business/news_business.dart';
import '../home/presentation/controller/news_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController(), fenix: true);
    Get.lazyPut<NewsBusiness>(() => NewsBusiness(), fenix: true);
    Get.lazyPut<NewsBusiness>(() => NewsBusiness(), fenix: true);
  }
}

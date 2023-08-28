import 'package:get/get.dart';

import '../globalServices/apiServices/networkService/abstract_network_service.dart';
import '../globalServices/apiServices/networkService/dio.dart';
import '../globalServices/apiServices/networkService/network_service.dart';
import '../home/data/repositoryImp/news_repo_imp.dart';
import '../home/domain/business/news_business.dart';
import '../home/domain/repository/news_repository.dart';

void setupLocator() {
  /// App Services
  Get.lazyPut<AbstractNetworkService>(() => NetworkService());
  Get.lazyPut<AppDio>(() => AppDio());

  /// Injection
  Get.lazyPut<NewsRepository>(() => NewRepositoryImp(), fenix: true);

  /// Business Services
  Get.lazyPut(() => NewsBusiness(), fenix: true);
}

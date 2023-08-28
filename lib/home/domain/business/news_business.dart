import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../baseModels/api_request_failure.dart';
import '../../../baseModels/base_bussniss.dart';
import '../entities/list_articles_entity.dart';
import '../repository/news_repository.dart';

class NewsBusiness extends BaseBusiness {
  final NewsRepository _newsRepository = Get.find<NewsRepository>();

  Future<Either<ApiRequestFailure, ArticlesResponseEntity?>> getArticles(
      String source) async {
    return await _newsRepository.getArticles(source);
  }
}

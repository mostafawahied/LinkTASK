import 'package:dartz/dartz.dart';

import '../../../../baseModels/api_request_failure.dart';
import '../entities/list_articles_entity.dart';

abstract class NewsRepository {
  Future<Either<ApiRequestFailure, ArticlesResponseEntity?>> getArticles(
      String source);
}

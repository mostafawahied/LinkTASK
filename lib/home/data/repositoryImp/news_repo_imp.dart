import 'package:dartz/dartz.dart';

import '../../../baseModels/api_request_failure.dart';
import '../../domain/entities/list_articles_entity.dart';
import '../../domain/repository/news_repository.dart';
import '../models/article_response_model.dart';
import '../service/news_service.dart';
import '../transformer/articles_transformer.dart';

class NewRepositoryImp implements NewsRepository {
  final NewsServices _newsService = NewsServices();

  @override
  Future<Either<ApiRequestFailure, ArticlesResponseEntity?>> getArticles(
      String source) async {
    final Either<ApiRequestFailure, ArticlesResponseModel> getArticlesResponse =
        await _newsService.getArticles(source);
    ArticlesResponseEntity? listArticles = ArticlesResponseEntity();

    return getArticlesResponse.fold((error) {
      return left(ApiRequestFailure(error: error.error));
    }, (data) async {
      listArticles =
          ArticlesTransformer.convertArticlesResponseModelToEntity(data);
      return right(listArticles);
    });
  }
}

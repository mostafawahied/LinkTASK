import '../../domain/entities/article_entity.dart';
import '../../domain/entities/list_articles_entity.dart';
import '../models/article_response_model.dart';

class ArticlesTransformer {
  static ArticlesResponseEntity convertArticlesResponseModelToEntity(
      ArticlesResponseModel articlesResponseModel) {
    ArticlesResponseEntity? articlesResponseEntity = ArticlesResponseEntity(
      articles: articlesResponseModel.articles
          ?.map(
            (item) => ArticleItemEntity(
              author: item.author,
              title: item.title,
              description: item.description,
              url: item.url,
              urlToImage: item.urlToImage,
              publishedAt: item.publishedAt,
            ),
          )
          .toList(),
    );
    return articlesResponseEntity;
  }
}

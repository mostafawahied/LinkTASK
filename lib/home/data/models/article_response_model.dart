import 'item_article_model.dart';

ArticlesResponseModel articlesResponseModelFromJson(
        Map<String, dynamic> data) =>
    ArticlesResponseModel.fromJson(data);

class ArticlesResponseModel {
  ArticlesResponseModel({
    this.articles,
  });

  final List<ItemArticleModel>? articles;

  factory ArticlesResponseModel.fromJson(Map<String, dynamic> json) =>
      ArticlesResponseModel(
        articles: List<ItemArticleModel>.from(
          json["articles"].map(
            (x) => ItemArticleModel.fromJson(x),
          ),
        ),
      );
}

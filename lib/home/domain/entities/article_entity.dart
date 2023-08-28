import '../../../baseModels/base_entity.dart';

class ArticleItemEntity extends BaseEntity {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;

  ArticleItemEntity({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });
}

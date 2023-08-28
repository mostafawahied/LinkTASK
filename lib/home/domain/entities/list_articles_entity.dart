import '../../../baseModels/base_entity.dart';
import 'article_entity.dart';

class ArticlesResponseEntity extends BaseEntity {
  final List<ArticleItemEntity>? articles;

  ArticlesResponseEntity({this.articles});
}

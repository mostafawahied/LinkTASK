import 'package:get/get.dart';

import '../../../core/enums/app_state.dart';
import '../../../core/getx/base_controller.dart';
import '../../../globalServices/appServices/dialogs_service.dart';
import '../../domain/business/news_business.dart';
import '../../domain/entities/article_entity.dart';

class NewsController extends BaseController {
  final NewsBusiness _newsBusiness = Get.find<NewsBusiness>();
  List<ArticleItemEntity>? articlesList = <ArticleItemEntity>[];

  @override
  void onInit() async {
    super.onInit();
    await getArticles();
  }

  Future<void> onRefresh() async {
    super.onInit();
    onInit();
  }

  Future<void> getArticles() async {
    await getArticlesFromPress();
    await getArticlesFromWeb();
  }

  Future<void> getArticlesFromPress() async {
    updateState = AppState.loading;
    final getArticlesEntity =
        await _newsBusiness.getArticles("associated-press");
    getArticlesEntity.fold(
      (error) {
        DialogsBuilder.apiErrorSnackBar(error.error ?? "");
      },
      (articles) {
        if (articles?.articles?.isNotEmpty ?? false) {
          articles?.articles?.forEach((element) {
            articlesList?.add(element);
          });
        }
      },
    );
    updateState = AppState.done;
  }

  Future<void> getArticlesFromWeb() async {
    updateState = AppState.loading;
    final getArticlesEntity = await _newsBusiness.getArticles("the-next-web");
    getArticlesEntity.fold(
      (error) {
        DialogsBuilder.apiErrorSnackBar(error.error ?? "");
      },
      (articles) {
        if (articles?.articles?.isNotEmpty ?? false) {
          articles?.articles?.forEach((element) {
            articlesList?.add(element);
          });
        }
      },
    );
    updateState = AppState.done;
  }
}

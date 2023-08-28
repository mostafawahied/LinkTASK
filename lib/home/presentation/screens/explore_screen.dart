import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:link_task/core/enums/app_state.dart';
import '../../../core/app_states/app_state_handler_widget.dart';
import '../controller/news_controller.dart';
import 'details_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.find<NewsController>();
    return RefreshIndicator(
      onRefresh: () => newsController.onRefresh(),
      child: GetBuilder<NewsController>(
        builder: (newsController) {
          return AppStateHandlerWidget(
            state: newsController.loadingState,
            child: newsController.loadingState == AppState.loading
                ? Container()
                : ListView.builder(
                    itemCount: newsController.articlesList?.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            DetailsScreen(
                              article: newsController.articlesList![index],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            height: 300,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    newsController
                                        .articlesList![index].urlToImage!,
                                    fit: BoxFit.fitWidth,
                                    width: 2000,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    //  height: 200,
                                    // width: 400,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    newsController.articlesList![index].title ??
                                        "",
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                if (newsController.articlesList![index].author
                                        ?.isNotEmpty ??
                                    false) ...[
                                  const SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text(
                                      "By ${newsController.articlesList![index].author ?? ""}",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      DateFormat("MMMM dd,yyyy").format(
                                        DateFormat("yyyy-MM-dd'T'HH:mm:ss")
                                            .parse(newsController
                                                    .articlesList![index]
                                                    .publishedAt ??
                                                ""),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}

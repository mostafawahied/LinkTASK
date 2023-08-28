import 'package:get/get.dart';
import 'package:link_task/home/presentation/screens/details_screen.dart';
import 'package:link_task/home/presentation/screens/e_magazine_screen.dart';
import 'package:link_task/home/presentation/screens/explore_screen.dart';
import 'package:link_task/home/presentation/screens/gallery_screen.dart';
import 'package:link_task/home/presentation/screens/live_chat_screen.dart';
import 'package:link_task/home/presentation/screens/wish_list_screen.dart';
import 'package:link_task/router/routes_constants.dart';

import '../home/domain/entities/article_entity.dart';
import '../home/presentation/screens/home_screen.dart';
import '../utils/global_binding.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: RoutesConstants.home,
      page: () => const HomeScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.explore,
      page: () => const ExploreScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.liveChat,
      page: () => const LiveChatScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.gallery,
      page: () => const GalleryScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.wishList,
      page: () => const WishListScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.eMagazine,
      page: () => const EMagazineScreen(),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
    GetPage(
      name: RoutesConstants.details,
      page: () => DetailsScreen(
        article: ArticleItemEntity(),
      ),
      transition: Transition.fade,
      binding: GlobalBindings(),
    ),
  ];
}

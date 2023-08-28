import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_task/home/presentation/screens/e_magazine_screen.dart';
import 'package:link_task/home/presentation/screens/live_chat_screen.dart';
import 'package:link_task/home/presentation/screens/wish_list_screen.dart';
import '../../../UIHelpers/images.dart';
import '../widgets/drawer_header.dart';
import '../widgets/item_widget.dart';
import 'explore_screen.dart';
import 'gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  static const List<Widget> pages = [
    ExploreScreen(),
    LiveChatScreen(),
    GalleryScreen(),
    WishListScreen(),
    EMagazineScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("LINK DEVELOPMENT"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                Images.search,
                height: 20,
                width: 20,
              ),
            ),
          )
        ],
      ),
      body: pages[selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeaderWidget(),
            ItemWidget(
              title: 'Explore',
              icon: Images.explore,
              selected: selectedIndex == 0,
              onTap: () {
                Get.back();
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            ItemWidget(
              title: 'Live Chat',
              icon: Images.live,
              selected: selectedIndex == 1,
              onTap: () {
                Get.back();
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            ItemWidget(
              title: 'Gallery',
              icon: Images.gallery,
              selected: selectedIndex == 2,
              onTap: () {
                Get.back();
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
            ItemWidget(
              title: 'Wish List',
              icon: Images.wishlist,
              selected: selectedIndex == 3,
              onTap: () {
                Get.back();
                setState(() {
                  selectedIndex = 3;
                });
              },
            ),
            ItemWidget(
              title: 'E-Magazine',
              icon: Images.magazine,
              selected: selectedIndex == 4,
              onTap: () {
                Get.back();
                setState(() {
                  selectedIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

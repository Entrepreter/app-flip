import 'package:app_flip/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final bottomNav = {
    'Home': Icons.store_mall_directory,
    'Search': Icons.search,
    "Cart": Icons.shopping_cart_outlined,
    "Profile": Icons.person_outline
  };

  final List<Widget> _pages = [
    HomeView(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];

  Widget get currentPageView => _pages[currentNavIndex.value];

  final currentNavIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setNavIndex(index) => currentNavIndex.value = index;
}

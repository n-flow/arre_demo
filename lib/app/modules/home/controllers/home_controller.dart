import 'package:arre_demo/app/modules/base_get_x_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeController extends BaseGetXController with GetTickerProviderStateMixin {

  final pageController = PageController();

  var selectedIndex = 0.obs;

  var isDockAdd = false.obs;
  var isScrollingDown = false.obs;
  var showAppbar = true.obs;

  static const List<Widget> widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Fire Page'),
    Text('Profile Page'),
  ];

  @override
  void onInit() {
    super.onInit();

    pageController.addListener(() {
      print("PageController:  ${pageController.position.userScrollDirection}   ${isScrollingDown.value}   ${showAppbar.value}");
      if (pageController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown.value) {
          isScrollingDown.value = true;
          showAppbar.value = false;
        }
      }

      if (pageController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown.value) {
          isScrollingDown.value = false;
          showAppbar.value = true;
        }
      }
    });
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void dispose() {
    pageController.dispose();
    pageController.removeListener(() {});
    super.dispose();
  }
}

import 'package:arre_demo/app/modules/home/controllers/home_controller.dart';
import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:arre_demo/app/utils/widgets/bottom_navigation/fancy_bar.dart';
import 'package:arre_demo/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomMenus extends StatelessWidget {

  final HomeController controller;

  const BottomMenus(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return FancyBottomBar(
      items: [
        FancyItem(
          0,
          SvgPicture.asset(
            Assets.assets_svg_home_icon_svg,
            height: controller.wdp(44),
            width: controller.wdp(44),
            colorFilter:
            const ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
          ),
          selectedWidget: SvgPicture.asset(
            Assets.assets_svg_home_icon_svg,
            height: controller.wdp(44),
            width: controller.wdp(44),
            colorFilter:
            const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        FancyItem(
          1,
          SvgPicture.asset(
            Assets.assets_svg_search_icon_svg,
            height: controller.wdp(44),
            width: controller.wdp(44),
            colorFilter:
            const ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
          ),
          selectedWidget: SvgPicture.asset(
            Assets.assets_svg_search_icon_svg,
            height: controller.wdp(44),
            width: controller.wdp(44),
            colorFilter:
            const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        FancyItem(
            -1,
            Stack(children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(Assets.assets_svg_icon_bg_svg,
                    height: controller.wdp(68), width: controller.wdp(68)),
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(Assets.assets_svg_mic_icon_svg,
                    height: controller.wdp(34), width: controller.wdp(34)),
              )
            ]),
            needAnimation: false),
        FancyItem(
          2,
          SvgPicture.asset(
            Assets.assets_svg_user_icon_svg,
            height: controller.wdp(44),
            width: controller.wdp(44),
            colorFilter:
            const ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
          ),
          selectedWidget: SvgPicture.asset(
            Assets.assets_svg_user_icon_svg,
            height: controller.wdp(44),
            width: controller.wdp(44),
            colorFilter:
            const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        FancyItem(
          3,
          Image.asset(Assets.assets_profile_icon_png,
              height: controller.wdp(44), width: controller.wdp(44)),
          selectedWidget: Image.asset(Assets.assets_profile_icon_png,
              height: controller.wdp(44), width: controller.wdp(44)),
        ),
      ],
      onItemSelected: (index) {
        print("onItemSelected:  ${index.index}");
        if (index.index != -1) {
          controller.pageController.jumpToPage(index.index,);
        }
      },
    );
  }
}
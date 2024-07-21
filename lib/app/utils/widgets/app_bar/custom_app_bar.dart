import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:arre_demo/app/utils/resolution.dart';
import 'package:arre_demo/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var top = constraints.biggest.height;
        return FlexibleSpaceBar(
          background: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: SDP.wdp(26)),
              height: top,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black.withOpacity(0.7),
                    AppColors.black.withOpacity(0.7)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(Assets.assets_svg_app_icon_svg,
                      height: SDP.wdp(54), width: SDP.wdp(54)),
                  const Spacer(),
                  Image.asset(
                    Assets.assets_bell_icon_png,
                    width: SDP.wdp(60),
                    height: SDP.wdp(60),
                    color: AppColors.white,
                  ),
                  Image.asset(
                    Assets.assets_chat_icon_png,
                    width: SDP.wdp(60),
                    height: SDP.wdp(60),
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

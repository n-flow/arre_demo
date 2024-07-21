import 'package:arre_demo/app/themes/app_text_theme.dart';
import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:arre_demo/app/utils/resolution.dart';
import 'package:arre_demo/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MusicPlayView extends StatelessWidget {

  const MusicPlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + SDP.hdp(40),
      color: AppColors.black.withOpacity(0.7),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SDP.wdp(18), vertical: SDP.hdp(18)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "How to make your business grow faster",
                        style: AppTextStyles.base.whiteColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "@ShellyShah",
                        style: AppTextStyles.base.colorOfCompany,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: SDP.wdp(16),
                ),
                SvgPicture.asset(Assets.assets_svg_heart_icon_svg,
                    height: SDP.wdp(34), width: SDP.wdp(34)),
                SizedBox(
                  width: SDP.wdp(16),
                ),
                Stack(alignment: Alignment.center, children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(Assets.assets_svg_icon_bg_svg,
                        height: SDP.wdp(68), width: SDP.wdp(68)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(Assets.assets_svg_play_icon_svg,
                        height: SDP.wdp(34), width: SDP.wdp(34)),
                  )
                ]),
                SizedBox(
                  width: SDP.wdp(16),
                ),
                SvgPicture.asset(Assets.assets_svg_drawer_icon_svg,
                    height: SDP.wdp(34), width: SDP.wdp(34)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LinearPercentIndicator(
              lineHeight: 3.0,
              padding: EdgeInsets.zero,
              barRadius: const Radius.circular(0),
              percent: 80 / 100,
              progressColor: AppColors.colorOfCompany,
            ),
          )
        ],
      ),
    );
  }
}

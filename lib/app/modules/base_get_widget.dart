import 'package:arre_demo/app/modules/base_get_x_controller.dart';
import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:arre_demo/app/utils/resolution.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseGetWidget<T extends BaseGetXController>
    extends GetWidget<T> {
  const BaseGetWidget({super.key});

  Color backgroundColor() => AppColors.white;

  PreferredSizeWidget? appBar() => null;

  Color scaffoldBackgroundColor() => AppColors.white;

  Widget? stickBottomWidget() => null;

  Widget? floatingActionWidget() => null;

  double wdp(double dp) => SDP.wdp(dp);

  double hdp(double dp) => SDP.hdp(dp);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: backgroundColor(),
        ),
        Scaffold(
          backgroundColor: scaffoldBackgroundColor(),
          appBar: appBar(),
          body: SafeArea(child: body(context)),
          bottomNavigationBar: stickBottomWidget(),
          floatingActionButton: floatingActionWidget(),
        ),
      ],
    );
  }

  Widget body(BuildContext context);
}

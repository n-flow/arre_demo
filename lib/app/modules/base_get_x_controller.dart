import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:arre_demo/app/utils/extensions/build_context.dart';
import 'package:arre_demo/app/utils/resolution.dart';
import 'package:arre_demo/app/utils/utils.dart';

abstract class BaseGetXController extends SuperController {

  Color statusBarColor() => AppColors.black.withOpacity(0.7);

  bool isStatusBarShow() => true;

  @override
  void onInit() {
    super.onInit();

    if (Get.context != null) {
      SDP.init(Get.context!);
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updateStatusBar();
    });
  }

  void updateStatusBar({SystemUiOverlayStyle? value}) {
    if (isStatusBarShow()) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);

      SystemUiOverlayStyle style = value ??
          SystemUiOverlayStyle(
              statusBarColor: statusBarColor(),
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light);

      SystemChrome.setSystemUIOverlayStyle(style);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom]);
    }
  }

  double wdp(double dp) => SDP.wdp(dp);

  double hdp(double dp) => SDP.hdp(dp);

  unFocusKeyboard(BuildContext context) {
    context.unFocusKeyboard();
  }

  void showInternetSnackBar() {
    showSnackBar(
        message: "Please Check Your Internet Connection",
        bgColor: AppColors.red);
  }

  @override
  void onResumed() {}

  @override
  void onPaused() {}

  @override
  void onInactive() {}

  @override
  void onDetached() {}

  @override
  void onHidden() {}
}

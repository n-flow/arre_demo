import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:arre_demo/app/utils/date_formats.dart';
import 'package:arre_demo/app/utils/extensions/data_type_extension.dart';
import 'package:arre_demo/app/utils/resolution.dart';
import 'package:arre_demo/app/utils/widgets/snack_bar/snack_bar_view.dart';
import 'package:flutter/material.dart';

void showSnackBar({
  String title = "",
  String message = "",
  Color bgColor = AppColors.red,
  Color titleColor = AppColors.white,
  Color msgColor = AppColors.white,
}) {
  SnackBarView(
    titleText: title.sIsNullOrEmpty
        ? null
        : Text(title, style: TextStyle(color: msgColor)),
    messageText: Text(message, style: TextStyle(color: msgColor)),
    snackPosition: SnackBarViewPosition.bottom,
    margin: const EdgeInsets.all(0),
    backgroundColor: bgColor,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SDP.wdp(15)),
        topRight: Radius.circular(SDP.wdp(15)),
        bottomLeft: Radius.circular(SDP.wdp(0)),
        bottomRight: Radius.circular(SDP.wdp(0))),
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(seconds: 3),
  ).show();
}

String getUniqueId({String? dateFormat}) {
  return "${getDateFormatFromDate(pattern: dateFormat)}_${getUniqueKey()}";
}

String getUniqueKey() {
  return UniqueKey().hashCode.toString();
}

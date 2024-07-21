import 'package:arre_demo/app/modules/base_get_widget.dart';
import 'package:arre_demo/app/modules/home/controllers/home_controller.dart';
import 'package:arre_demo/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/song_lists_controller.dart';

class SongListsView extends BaseGetWidget<SongListsController> {
  final HomeController homeController = Get.find();

  SongListsView({super.key});

  @override
  Widget body(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.isDockAdd.value = true;
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.assets_music_banner_png,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}

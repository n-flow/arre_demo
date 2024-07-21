import 'package:arre_demo/app/modules/artists/controllers/artists_controller.dart';
import 'package:arre_demo/app/modules/artists/views/artists_view.dart';
import 'package:arre_demo/app/modules/base_get_widget.dart';
import 'package:arre_demo/app/modules/home/views/bottom_menu_view.dart';
import 'package:arre_demo/app/modules/home/views/music_play_view.dart';
import 'package:arre_demo/app/modules/search_music/controllers/search_music_controller.dart';
import 'package:arre_demo/app/modules/search_music/views/search_music_view.dart';
import 'package:arre_demo/app/modules/song_lists/controllers/song_lists_controller.dart';
import 'package:arre_demo/app/modules/song_lists/views/custom_bottom_sheet.dart';
import 'package:arre_demo/app/modules/song_lists/views/song_lists_view.dart';
import 'package:arre_demo/app/modules/user_profile/controllers/user_profile_controller.dart';
import 'package:arre_demo/app/modules/user_profile/views/user_profile_view.dart';
import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:arre_demo/app/utils/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends BaseGetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              backgroundColor: AppColors.transparent,
              elevation: 0,
              snap: true,
              pinned: true,
              expandedHeight: hdp(100),
              flexibleSpace: const CustomAppBar(),
            ),
          ];
        },
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            GetBuilder<SongListsController>(
              autoRemove: false,
              builder: (_) => SongListsView(),
            ),
            GetBuilder<SearchMusicController>(
              autoRemove: false,
              builder: (_) => const SearchMusicView(),
            ),
            GetBuilder<ArtistsController>(
              autoRemove: false,
              builder: (_) => const ArtistsView(),
            ),
            GetBuilder<UserProfileController>(
              autoRemove: false,
              builder: (_) => const UserProfileView(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Wrap(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Column(children: [
            Obx(
              () => controller.isDockAdd.value == true
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: CustomBottomSheet(
                        child: const MusicPlayView(),
                        onDismissed: (_) {
                          controller.isDockAdd.value = false;
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            BottomMenus(controller),
          ]),
        ),
      ]),
    );
  }
}

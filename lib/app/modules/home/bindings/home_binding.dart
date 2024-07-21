import 'package:arre_demo/app/modules/artists/controllers/artists_controller.dart';
import 'package:arre_demo/app/modules/search_music/controllers/search_music_controller.dart';
import 'package:arre_demo/app/modules/song_lists/controllers/song_lists_controller.dart';
import 'package:arre_demo/app/modules/user_profile/controllers/user_profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<SongListsController>(
      () => SongListsController(),
    );

    Get.lazyPut<SearchMusicController>(
      () => SearchMusicController(),
    );

    Get.lazyPut<ArtistsController>(
      () => ArtistsController(),
    );

    Get.lazyPut<UserProfileController>(
      () => UserProfileController(),
    );
  }
}

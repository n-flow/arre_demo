import 'package:get/get.dart';

import '../controllers/search_music_controller.dart';

class SearchMusicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchMusicController>(
      () => SearchMusicController(),
    );
  }
}

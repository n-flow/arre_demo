import 'package:get/get.dart';

import '../controllers/song_lists_controller.dart';

class SongListsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongListsController>(
      () => SongListsController(),
    );
  }
}

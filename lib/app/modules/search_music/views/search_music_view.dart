import 'package:arre_demo/app/modules/base_get_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/search_music_controller.dart';

class SearchMusicView extends BaseGetWidget<SearchMusicController> {
  const SearchMusicView({super.key});

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'SearchMusicView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

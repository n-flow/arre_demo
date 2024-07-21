import 'package:arre_demo/app/modules/base_get_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/artists_controller.dart';

class ArtistsView extends BaseGetWidget<ArtistsController> {
  const ArtistsView({super.key});

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'ArtistsView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

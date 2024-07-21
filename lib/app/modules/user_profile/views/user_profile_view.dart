import 'package:arre_demo/app/modules/base_get_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends BaseGetWidget<UserProfileController> {
  const UserProfileView({super.key});

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'UserProfileView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

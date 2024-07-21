import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arre_demo/assets.dart';

import '../controllers/route_not_found_page_controller.dart';

class RouteNotFoundPageView extends GetView<RouteNotFoundPageController> {
  const RouteNotFoundPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RouteNotFound'.tr)),
        body: Stack(
          children: [
            PositionedTransition(
              rect: controller.relativeRectTween
                  .animate(controller.animController),
              child: Image.asset(Assets.assets_images_brain_png),
            ),
            const Positioned(
              top: 150,
              bottom: 0,
              left: 24,
              right: 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '404',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        letterSpacing: 2,
                        color: Color(0xff2f3640),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Sorry, we could not find the page!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff2f3640),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

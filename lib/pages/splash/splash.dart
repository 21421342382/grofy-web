import 'package:flutter/material.dart';

import '../../constrants/color.dart';
import '../../controllers/assets/assets.dart';
import '../../controllers/engine/engine_controller.dart';
import '../../controllers/home/home_controller.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    engine_controller().user_logged_in(context);
    home_controller.load_item_for_search(context);
    return Scaffold(
      backgroundColor: ColorHelper.drawer_color,
      body: Center(
        child: Image.asset(assets.appbar_anim_2),
      ),
    );
  }
}

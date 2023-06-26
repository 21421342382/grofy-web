import 'package:flutter/material.dart';

import '../../constrants/color.dart';
import '../../widgets/appbar.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.color[0],
      body: Column(
        children: [
          app_bar(context)
        ],
      ),
    );
  }
}

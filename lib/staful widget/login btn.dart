import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constrants/color.dart';


class btn extends StatefulWidget {
  btn({Key? key, required this.text}) : super(key: key);
final text ;
  @override
  State<btn> createState() => _btnState();
}

class _btnState extends State<btn> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle button tap here
        print('Button tapped');
      },
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: ColorHelper.drawer_color),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isHovered ? 40 : 50,
          decoration: BoxDecoration(
            color: isHovered
                ? ColorHelper.drawer_color.withOpacity(0.30)
                : Colors.transparent,
            border: Border.all(color: ColorHelper.drawer_color),
          ),
          child: Center(
            child: Text(
              "${widget.text}",
              style: TextStyle(letterSpacing: 0.30),
            ),
          ),
        ),
      ),
    );
  }
}

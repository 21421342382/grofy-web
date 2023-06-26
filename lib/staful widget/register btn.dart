import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_grofy/controllers/sign%20up/sign_up.dart';

import '../constrants/color.dart';
import '../controllers/login/login.dart';


class register_btn extends StatefulWidget {
  register_btn({Key? key, required this.text, required this.funct}) : super(key: key);
  final text ;
  final funct ;
  @override
  State<register_btn> createState() => _register_btnState();
}

class _register_btnState extends State<register_btn> {
  bool isHovered = false;
  bool is_tapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        // Handle button tap here
        print('Button tapped');
        setState(() {
          is_tapped = true;
        });
        var res = await sign_up_controller.validate(context);
        if(await res == false){
          setState(() {
            is_tapped = false;
          });
        }
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
            child: is_tapped
                ?CircularProgressIndicator(strokeWidth: 1,color: ColorHelper.color[2],)
                :Text(
              "${widget.text}",
              style: TextStyle(letterSpacing: 0.30),
            ),
          ),
        ),
      ),
    );
  }
}

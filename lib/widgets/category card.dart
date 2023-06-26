import 'package:flutter/material.dart';

import '../constrants/color.dart';


class category_card extends StatelessWidget {
  category_card({Key? key, required this.image, required this.title}) : super(key: key);
final image ;
final title ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorHelper.color[9].withOpacity(0.20),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: Image.asset(image,height: 80,width: 80,fit: BoxFit.fitWidth,),
            ),
          ),
          Center(
            child: Text(title,style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }
}

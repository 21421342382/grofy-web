import 'package:flutter/material.dart';

import '../../../constrants/color.dart';
import '../../../controllers/assets/assets.dart';
import '../../../staful widget/login btn.dart';

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.color[0],
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: 400,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Sign in to Grofy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 0.50),),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 28,right: 28,top: 18),
                  child: Container(
                    height: 80,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("username",style: TextStyle(color: ColorHelper.r_g_b[13]),),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorHelper.r_g_b[12],
                              boxShadow: [
                                BoxShadow(
                                    color: ColorHelper.color[1],
                                    blurRadius: 6.0,
                                    offset: Offset(0,4)
                                )
                              ]
                          ),
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: TextFormField(
                                  cursorColor: ColorHelper.color[2],
                                  decoration: InputDecoration.collapsed(hintText: "Enter username"),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 28,right: 28,top: 18),
                  child: Container(
                    height: 80,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("phone",style: TextStyle(color: ColorHelper.r_g_b[13]),),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorHelper.r_g_b[12],
                              boxShadow: [
                                BoxShadow(
                                    color: ColorHelper.color[1],
                                    blurRadius: 6.0,
                                    offset: Offset(0,4)
                                )
                              ]
                          ),
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: TextFormField(
                                  cursorColor: ColorHelper.color[2],
                                  decoration: InputDecoration.collapsed(hintText: "Enter phone number"),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),

                Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: btn(text: "SIGN IN",)
                ),
                Expanded(child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Already a User ? Login",style: TextStyle(color: ColorHelper.color[3],decoration: TextDecoration.underline),),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assets.slide_image_2)
                      ,fit: BoxFit.fitWidth,
                    )
                ),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 48,bottom: 200),
                          child: Image.asset(assets.with_grofy_everything_is_easier),
                        )
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 48,bottom: 50),
                          child: Image.asset(assets.grofy_the_innovative_grocery),
                        )
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}

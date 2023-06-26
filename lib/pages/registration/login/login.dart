import 'package:flutter/material.dart';

import '../../../constrants/color.dart';
import '../../../controllers/assets/assets.dart';
import '../../../controllers/login/login.dart';
import '../../../staful widget/login btn.dart';
import '../../../staful widget/register btn.dart';
import '../register/register.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

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
                  child: Text("Login to Grofy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 0.50),),
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
                                controller: login_controller.user_nane,
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
                                  controller: login_controller.phone,
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
                  child: btn(text: "LOGIN",funct: login_controller.validate(context),)
                ),
                Expanded(child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (_, __, ___) => register(),
                            transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Text("New User ? Create new account",style: TextStyle(color: ColorHelper.color[3],decoration: TextDecoration.underline),),
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
                  image: AssetImage(assets.slide_image_1)
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
                        child: Image.asset(assets.buy_anything_anywhere),
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

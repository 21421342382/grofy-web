import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_grofy/controllers/account/account_controller.dart';

import '../constrants/Icons.dart';
import '../constrants/color.dart';
import '../pages/registration/login/login.dart';
import '../staful widget/search.dart';
import '../user/user.dart';

Widget app_bar(context){
  final screenWidth = MediaQuery.of(context).size.width;
  return Container(
    height: 90,
    width: double.infinity,
    child: Column(
      children: [
        Expanded(
          child: Center(
            child: Row(
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: 180,
                    child: Center(child: Text("grofy",style: GoogleFonts.leagueSpartan(color: ColorHelper.r_g_b[14],fontWeight: FontWeight.bold,fontSize: 44),)),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 1,
                  color: ColorHelper.color[1].withOpacity(0.60)
                ),
                SizedBox(width: 30,),
                Container(
                    width: 200,
                    child: Column(
                      children: [
                        SizedBox(height: 2,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("DELIVERY IN",style : TextStyle(fontSize: 18))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("39 minutes",style : TextStyle(fontSize: 30,fontWeight: FontWeight.bold)))
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const search()));
                    },
                    child: Container(
                      height: 50,
                      width: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: ColorHelper.color[1].withOpacity(0.30),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              IconHelper.icons[10],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                FadeAnimatedText('Search "sugar"'),
                                FadeAnimatedText('Search "wheat"'),
                                FadeAnimatedText('Search "onions"'),
                                FadeAnimatedText('Search "eggs"'),
                                FadeAnimatedText('Search "everything"'),
                              ],
                              onTap: () {
                                print("Tap Event");
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => const search()));
                              },
                              repeatForever: true,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                ),
                InkWell(
                  onTap: (){
                    if(user.is_login == true){
                      account_controller.logout(context);
                    }else{
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));
                    }
                  },
                  child: Container(
                    width: 160,
                    child: Center(
                      child: Text(user.is_login ? "Account" : "Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,letterSpacing: 1),),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: 80,
                      width: 130,
                      decoration: BoxDecoration(
                        color: ColorHelper.r_g_b[14],
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(
                        child: Text("Cart : 0",style: TextStyle(color: ColorHelper.color[0],fontWeight: FontWeight.bold,letterSpacing: 1),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        Align(
            alignment: Alignment.topCenter,
            child: Divider(color: ColorHelper.color[1].withOpacity(0.60),thickness: 0.50,))
      ],
    ),
  );
}
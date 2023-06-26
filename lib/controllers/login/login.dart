import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/home/home.dart';
import '../../pages/splash/splash.dart';
import '../../user/user.dart';

class login_controller{
  static TextEditingController user_nane = new TextEditingController();
  static TextEditingController phone = new TextEditingController();

  static validate(context) async{
    EasyLoading.showProgress(0.30,status: "Verifying Account");
    if(user_nane.text == ""){
      Get.snackbar(
        "User Name not Valid",
        "Please Enter Valid User Name to continue",
      );
      EasyLoading.dismiss();
      return false;
    }else{
      if(isValidPhoneNumber(phone.text) == false){
        Get.snackbar(
          "Phone Number not Valid",
          "Please Enter Valid Phone Number to continue",
        );
        EasyLoading.dismiss();
        return false;
      }else{
        EasyLoading.showProgress(0.60,status: "Login Account");
        final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('users'));
        // `whereContains` is a basic query method that checks if string field
        // contains a specific substring
        parseQuery.whereContains('username', user_nane.text);

        // The query will resolve only after calling this method, retrieving
        // an array of `ParseObjects`, if success
        final ParseResponse apiResponse = await parseQuery.query();

        if (apiResponse.success && apiResponse.results != null) {
          EasyLoading.showProgress(0.70,status: "Login Account");
          for (var o in apiResponse.results!) {
            final QueryBuilder<ParseObject> parseQuery =
            QueryBuilder<ParseObject>(ParseObject('users'));
            // `whereContains` is a basic query method that checks if string field
            // contains a specific substring
            parseQuery.whereEqualTo('phone', phone.text);

            // The query will resolve only after calling this method, retrieving
            // an array of `ParseObjects`, if success
            final ParseResponse apiResponse = await parseQuery.query();

            if (apiResponse.success && apiResponse.results != null) {
              for (var o in apiResponse.results!) {
                EasyLoading.showProgress(0.80,status: "Login Account");
                  var data = apiResponse.results as List<ParseObject>;
                  user.password = data[0]["password"];
                  user.location = data[0]["location"];
                  user.cart = data[0]["cart"];
                  user.phone = data[0]["phone"];
                  user.cart_price = data[0]["price"];
                  user.obj_id = data[0]["objectId"];
                  user.my_orders = data[0]["my_orders"];
                  print(user.my_orders);
                  user.my_oders_price = data[0]["my_order_price"];
                  user.cart_price = data[0]["price"];
                  user.obj_id = data[0]["objectId"];
                  user.profile_photo = data[0]["profile_photo"];
                  if(user.profile_photo == null){
                    user.has_profile_photo = false;
                  }else{
                    user.has_profile_photo = true;
                  }
                EasyLoading.showProgress(0.90,status: "Login Account");
                  print("/////////////////////////////////////////////////");
                  print("PRINTING USER DETAILS");
                  print("user cart - " + "${user.cart}");
                  print("user location - " + "${user.location}");
                  print("user username - " + "${user.username}");
                  print("user email - " + "${user.email}");
                  print("user password - " + "${user.password}");
                  print("user profile - " + "${user.profile_photo}");
                  user.is_login = true;
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("login", "true");
                  prefs.setString("name", user_nane.text);
                  EasyLoading.dismiss();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => splash()), (route) => false);
                }

              } else{
              Get.snackbar(
                "User Doesn't Exist",
                "Please enter different username",
              );
              EasyLoading.dismiss();
              return false;
            }

          }


        }else{
          Get.snackbar(
            "User Doesn't Exist",
            "Please enter different username",
          );
          EasyLoading.dismiss();
          return false;
        }

      }
    }
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned number meets the desired format
    if (cleanedNumber.length == 10) {
      return true;
    } else {
      return false;
    }
  }
}
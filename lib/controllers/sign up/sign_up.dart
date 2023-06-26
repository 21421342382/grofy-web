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
import '../engine/engine_controller.dart';

class sign_up_controller {
  static TextEditingController user_nane = new TextEditingController();
  static TextEditingController phone = new TextEditingController();

  static validate(context) async {
    EasyLoading.showProgress(0.30, status: "Validating Account");
    if (user_nane.text == "") {
      Get.snackbar(
        "User Name not Valid",
        "Please Enter Valid User Name to continue",
      );
      EasyLoading.dismiss();
      return false;
    } else {
      if (isValidPhoneNumber(phone.text) == false) {
        Get.snackbar(
          "Phone not Valid",
          "Please Enter Valid Phone Number to continue",
        );
        EasyLoading.dismiss();
        return false;
      } else {
        EasyLoading.showProgress(0.50, status: "Creating Account");
        final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('users'));
        // `whereContains` is a basic query method that checks if string field
        // contains a specific substring
        parseQuery.whereContains('username', user_nane.text);

        // The query will resolve only after calling this method, retrieving
        // an array of `ParseObjects`, if success
        final ParseResponse apiResponse = await parseQuery.query();

        if (apiResponse.success && apiResponse.results != null) {
          for (var o in apiResponse.results!) {
            print((o as ParseObject).toString());
            Get.snackbar(
              "User Already Exist",
              "Please enter different username",
            );
          }
          EasyLoading.dismiss();
          return false;
        } else {
          EasyLoading.showProgress(0.50, status: "Creating Account");
          final QueryBuilder<ParseObject> parseQuery2 =
          QueryBuilder<ParseObject>(ParseObject('users'));
          // `whereContains` is a basic query method that checks if string field
          // contains a specific substring
          parseQuery2.whereContains('phone', phone.text);

          // The query will resolve only after calling this method, retrieving
          // an array of `ParseObjects`, if success
          final ParseResponse apiResponse2 = await parseQuery2.query();

          if (apiResponse2.success && apiResponse2.results != null) {
            for (var o in apiResponse2.results!) {
              print((o as ParseObject).toString());
              Get.snackbar(
                "Phone Number Already Exist",
                "Please enter different phone number",
              );
            }
            EasyLoading.dismiss();
            return false;
          } else {
            EasyLoading.showProgress(0.60, status: "Creating Account");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("login", "true");
            prefs.setString("name", user_nane.text);

            user.is_login = true;
            print(user.location);
            final todo = ParseObject('users')
              ..set('cart', [])..set(
                  'price', 0)..set('location', user.location)..set(
                  'my_orders', user.my_orders)..set('phone', phone.text)..set(
                  'my_order_price', user.my_oders_price)..set('username' , user_nane.text);
            await todo.save();
            user.username = user_nane.text;
            user.username = phone.text;
            user.cart = [];
            print("Account Created !!!");
            EasyLoading.showProgress(0.90, status: "Creating Account");
            engine_controller().user_logged_in(context);
            EasyLoading.dismiss();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => splash()), (
                route) => false);
          }
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



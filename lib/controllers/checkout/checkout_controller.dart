import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_discord_logger/flutter_discord_logger.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import '../../main.dart';
import '../../user/user.dart';


class checkout_controller {
  static TextEditingController name = new TextEditingController();
  static TextEditingController country_code = new TextEditingController();
  static TextEditingController phone = new TextEditingController();
  static TextEditingController otp = new TextEditingController();
  static TextEditingController alternate_phone = new TextEditingController();
  static TextEditingController alternate_phone_otp =
      new TextEditingController();
  static TextEditingController landmark = new TextEditingController();
  static TextEditingController locality = new TextEditingController();
  static TextEditingController pincode = new TextEditingController();
  static TextEditingController city = new TextEditingController();
  static TextEditingController state = new TextEditingController();
  static TextEditingController brief_address = new TextEditingController();

  static var verification_id;

  static var verification_id_2;

  var paymentIntent;

  static var razorpay = Razorpay();
  static var amount ;

  static bool is_payment_done = false;

  static var prducts ;

  static verify_otp() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (otp.text.isEmpty) {
      Get.snackbar("Wrong OTP ", "Please Enter Correct OTP to continue");
    } else {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: checkout_controller.verification_id,
            smsCode: checkout_controller.otp.text);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      } catch (e) {
        Get.snackbar("Wrong OTP ", "Please Enter Correct OTP to continue");
      }
    }
  }

  static verify_otp_alternate() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (alternate_phone_otp.text.isEmpty) {
      Get.snackbar("Wrong OTP ", "Please Enter Correct OTP to continue");
    } else {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: checkout_controller.verification_id_2,
            smsCode: checkout_controller.alternate_phone_otp.text);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      } catch (e) {
        Get.snackbar("Wrong Alternate Phone OTP ",
            "Please Enter Correct Alternate Phone OTP to continue");
      }
    }
  }


  var options = {
    'key': 'rzp_test_BkBJbDxdJzYeW6',
    'amount': "${amount}00",
    'name': '${user.username}',
    'description': '${prducts}',
    'prefill': {
      'contact': '8409037655',
      'email': 'test@razorpay.com'
    }
  };

  open_payment_page(){
    razorpay.open(options);
  }

  update_my_orders() async {
    var todo1 = ParseObject('users')
      ..objectId = user.obj_id
      ..set('my_orders', user.my_orders);
    await todo1.save();
    print("My Orders Updated");
  }

//   verify_all(context , rent) async {
//     var num_ = checkout_bodY.widget.products.length;
//     var numbers = 0;
//     if (is_payment_done == true) {
//       for (var number in checkout_bodY.widget.products) {
//         print(number);
//         // List loc = await get_seller_location(number["token"]);
//         // print(number["token"]);
//         // print(loc);
//         // if (loc != null) {
//         //   print(loc);
//         //   var boy = await choose_delivery_boy(loc[0], loc[1] , number , number["price"]);
//         //   print(boy);
//         //   if (boy != null) {
//         //     numbers = numbers+1;
//         //   }
//         // }
//         final QueryBuilder<ParseObject> parseQuery =
//         QueryBuilder<ParseObject>(ParseObject('sellers'));
//         // `whereContains` is a basic query method that checks if string field
//         // contains a specific substring
//         parseQuery.whereContains('token', '${number["token"]}');
//
//         // The query will resolve only after calling this method, retrieving
//         // an array of `ParseObjects`, if success
//         final ParseResponse apiResponse = await parseQuery.query();
//
//         if (apiResponse.success && apiResponse.results != null) {
//           for (var o in apiResponse.results!) {
//             print((o as ParseObject).toString());
//             late final Discord discord = Discord(
//
//               appName: 'app',
//
//               webhookUrl: "https://discord.com/api/webhooks/1109051140882038825/7kO0Fggf_aQ_KC6zIJZKBQkM-vlG-2o1iHVD3U7brgWowbJb9iH7eEZ2PX7IT_x8MbXo",
//             );
//
//             discord.send(
//               message: '''
//
//
// //////////////////////////////////////////////////////////////////////////////////////////////
//
// Hey There, New Order Recieved
//
//
// Order Details :
//    title : ${number["title"]},
//    description : ${number["des"]},
//    price : ${number["price"]},
//    seller number : ${o["phone"]}
//    customer phone number : ${user.phone}
//    time: ${DateTime.now().toString()}
//           ''',
//             );
//             print("///////////////////////////////////////////////////////////////");
//
//
//             var past_orders = o["delivery"] as List<dynamic>? ?? []; // Initialize as empty list if null
//             var new_order = {
//               "order": number,
//               "name" : user.username,
//               "time": DateTime.now().toString(),
//             };
//
//             past_orders.add(new_order);
//
//             var todo1 = ParseObject('sellers')
//               ..objectId = o["objectId"]
//               ..set('rent', int.parse("${o["rent"] + rent}"))
//               ..set('delivery', past_orders);
//             await todo1.save();
//
//
//
//
//           }
//         }
//         numbers = numbers+1;
//       }
//       while(numbers == num_){
//         user.cart = [];
//         user.cart_price = 0;
//
//         cart_controller.cart_update();
//         await Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (context) => payment_success()),
//                 (route) => false);
//       }
//     } else {
//       verify_all(context , rent);
//     }
//   }

  choose_delivery_boy(lat, long , order , price) async {
    bool founded = false;
    while (founded == false) {
      double meters = 500;
      double coef = meters / 111320.0;
      double new_lat = lat + coef;
      double new_long = long + coef / cos(lat * 0.01745);
      //////////////////////////////////////////////////////////
      QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject('deliveryBoy'));
      final ParseResponse apiResponse = await queryTodo.query();
      if (apiResponse.success && apiResponse.results != null) {
        for (var boy in apiResponse.results!) {
          print(boy);
          bool avail = isPersonAvailable(
              Person(latitude: boy["lat"], longitude: boy["long"]), user.lat,
              user.long, new_lat, new_long, 1);
          print(avail);
          if (avail == true) {
            if (boy["is_active"] == true) {
              // print(double.parse(
              //     // checkout_bodY.widget.products[0]["price"]) *
              //     // 0.1);
              // ));
              print("////////////////////////////////////////////////////////////////");
              print(int.parse(price) * 0.1);
              var todo = ParseObject('payment')
                ..set('delivery_boy_price', "${int.parse(price) * 0.1}")
                ..set('order', [order,"${checkout_controller.phone.text}"]);
              todo.save();

              var todo2 = ParseObject('deliveryBoy')
                ..objectId = boy["objectId"]
                ..set('order', [order,"${checkout_controller.phone.text}"]);
              todo2.save();

              var todo3 = ParseObject('deliveryBoy')
                ..objectId = boy["objectId"]
                ..set('is_active', false);
              todo3.save();

              print("Status Saved");
              founded = true;
              return boy;
            }
          }
        }
      }
    }
    return null;
  }

  get_seller_location(token) async {
    final QueryBuilder<ParseObject> parseQuery =
    QueryBuilder<ParseObject>(ParseObject('tokens'));
    parseQuery.whereContains('token', '$token');
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var o in apiResponse.results!) {
        final QueryBuilder<ParseObject> parseQuery2 =
        QueryBuilder<ParseObject>(ParseObject('sellers'));
        parseQuery2.whereContains('objectId', '${o["obj_id"]}');
        final ParseResponse apiResponse2 = await parseQuery2.query();
        if (apiResponse2.success && apiResponse2.results != null) {
          for (var o in apiResponse2.results!) {
            return [o["lat"], o["long"]];
          }
        }
      }
    }
    return null;
  }

  // verify_all(lat , long , context) async{
      //   var la_t = lat;
      //   var lon_g = long;
      //   print("Process Started");
      //   print(is_payment_done);
      //   if(is_payment_done == true){
      //     print(is_payment_done);
      //     double meters = 500;
      //
      //     double coef = meters / 111320.0;
      //
      //     double new_lat = lat + coef;
      //
      //     double new_long = long + coef / cos(lat * 0.01745);
      //     QueryBuilder<ParseObject> queryTodo =
      //     QueryBuilder<ParseObject>(ParseObject('deliveryBoy'));
      //     final ParseResponse apiResponse = await queryTodo.query();
      //
      //     if (apiResponse.success && apiResponse.results != null) {
      //       for (var boy in apiResponse.results !) {
      //         // print(boy);
      //         bool avail = isPersonAvailable(Person(latitude: boy["lat"], longitude: boy["long"]), user.lat, user.long, new_lat, new_long, 1);
      //         // print(avail);
      //         if(avail == true){
      //           if(boy["is_active"] == true){
      //             print(double.parse(checkout_bodY.widget.products[0]["price"])* 0.1);
      //             var todo = ParseObject('payment')
      //               ..set('order', [checkout_bodY.widget.products[0]["price"]* 0.1])
      //               ..set('order', [checkout_bodY.widget.products]);
      //             await todo.save();
      //             print("Statues Saved");
      //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => payment_success()));
      //           }else{
      //             verify_all(la_t, lon_g , context);
      //           }
      //         }else{
      //           verify_all(la_t, lon_g , context);
      //         }
      //       }
      //     } else {
      //       return [];
      //     }
      //
      //   }else{
      //
      //     verify_all(la_t, lon_g , context);
      //   }
      //
      //
      // }

  bool isPersonAvailable(Person person, double startLat, double startLong,
      double endLat, double endLong, double maxDistance) {
    const double earthRadius = 6371.0; // Earth's radius in km
    double latDiff = (endLat - startLat) * pi / 180.0;
    double longDiff = (endLong - startLong) * pi / 180.0;
    double startLatRad = startLat * pi / 180.0;
    double endLatRad = endLat * pi / 180.0;

    double a = sin(latDiff / 2) * sin(latDiff / 2) +
        sin(longDiff / 2) *
            sin(longDiff / 2) *
            cos(startLatRad) *
            cos(endLatRad);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance <= maxDistance;
  }
}

class Person {
  double latitude;
  double longitude;

  Person({required this.latitude, required this.longitude});
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:web_grofy/pages/registration/login/login.dart';
import 'package:web_grofy/pages/registration/register/register.dart';

import '../constrants/color.dart';
import '../controllers/cart/cart controller.dart';
import '../user/user.dart';

class cart_btn extends StatefulWidget {
  cart_btn({Key? key, required this.title, required this.des, required this.price, required this.image, required this.stock, required this.lat, required this.token, required this.long, required this.cat, required this.open, required this.size}) : super(key: key);
  final title;

  final des;

  final price;

  final image;

  final stock;

  final lat;

  final token;

  final long;

  final cat;

  final open;

  final size;

  @override
  State<cart_btn> createState() => _cart_btnState();
}

class _cart_btnState extends State<cart_btn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(user.cart.any((element) => element['title'] == widget.title));
    if (user.cart.any((element) => element['title'] == widget.title) == true) {
      like = true;
    } else {
      like = false;
    }
  }

  bool like = false;
  Widget build(BuildContext context) {
    return like == true
      ? InkWell(
      onTap: () {
        print("Changed");
        if (user.is_login == true) {
          setState(() {
            var prev_price = user.cart_price;
            like = false;
            user.cart.removeWhere(
                    (element) => element["title"] == widget.title);
            user.cart.removeWhere(
                    (element) => element["des"] == widget.des);
            user.cart.removeWhere(
                    (element) => element["price"] == widget.price);
            user.cart.removeWhere(
                    (element) => element["image"] == widget.image);
            user.cart.removeWhere(
                    (element) => element["shop_status"] == widget.open);
            user.cart.removeWhere(
                    (element) => element["stock"] == widget.stock);
            user.cart.removeWhere(
                    (element) => element["long"] == widget.long);
            user.cart.removeWhere(
                    (element) => element["lat"] == widget.lat);
            user.cart.removeWhere(
                    (element) => element["cat"] == widget.cat);
            user.cart.removeWhere(
                    (element) => element["size"] == widget.size);
            user.cart.removeWhere(
                    (element) => element["token"] == widget.token);
            user.cart_price = prev_price - int.parse(widget.price);
            print(user.cart);
            print(user.cart.length);
            // cart_button_state.setState(() {
            //   cart_button_state.number = "${user.cart.length}";
            //   cart_button_state.update();
            // });
            // cart_controller.cart_update();
          });
        } else {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => register()));
        }
      },
      child: Container(
        height: 27,
        width: 80,
        decoration: BoxDecoration(
          color: like ?ColorHelper.color[8] : ColorHelper.color[8].withOpacity(0.20),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: ColorHelper.color[8])
        ),
        child: Center(
          child: Text('${like ? "ADDED" : "ADD"}',style: TextStyle(color:like ?ColorHelper.color[0] : ColorHelper.color[8],fontWeight: FontWeight.bold,letterSpacing: 0.35,fontSize: 12),),
        ),
      ),
    )
        : InkWell(
      onTap: () {
        print("Changed");
        if (user.is_login == true) {
          if (widget.stock == "In Stock") {
            if (widget.open == true) {
              setState(() {
                user.new_order = true;
                like = true;
                print("Cat - ${widget.cat}");
                var product = {
                  "title": widget.title,
                  "des": widget.des,
                  "price": widget.price,
                  "image": widget.image,
                  "stock": widget.stock,
                  "lat": widget.lat,
                  "long": widget.long,
                  "cat": widget.cat,
                  "size": null,
                  "token": widget.token,
                  "shop_status": widget.open,
                  "quantity": 1,
                  'drop_location_lat': "${user.lat}",
                  'drop_location_long': "${user.long}"
                };
                user.cart.add(product);
                var prev_price = user.cart_price;
                user.cart_price =
                    prev_price + int.parse(widget.price);
                print(user.cart);
                print(user.cart.length);
                // cart_button_state.setState(() {
                //   cart_button_state.number = "${user.cart.length}";
                //   cart_button_state.update();
                // });
                cart_controller.cart_update();
              });
            } else {
              Get.snackbar("Shop is Closed", "Can't add to cart");
            }
          } else {
            Get.snackbar("Out of Stock", "Can't add to cart");
          }
        } else {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => login()));
        }
      },
      child: Container(
        height: 27,
        width: 80,
        decoration: BoxDecoration(
            color: like ?ColorHelper.color[8] : ColorHelper.color[8].withOpacity(0.20),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: ColorHelper.color[8])
        ),
        child: Center(
          child: Text('${like ? "ADDED" : "ADD"}',style: TextStyle(color:like ?ColorHelper.color[0] : ColorHelper.color[8],fontWeight: FontWeight.bold,letterSpacing: 0.35,fontSize: 12),),
        ),
      ),
    );
  }
}

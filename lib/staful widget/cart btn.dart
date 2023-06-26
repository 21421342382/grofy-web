import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constrants/Icons.dart';
import '../constrants/color.dart';
import '../controllers/cart/cart controller.dart';
import '../pages/registration/login/login.dart';
import '../user/user.dart';


class cart_button extends StatefulWidget {
  const cart_button(
      {Key? key,
      required this.title,
      required this.des,
      required this.price,
      required this.image,
      required this.stock,
      required this.lat,
      required this.long,
      this.cat,
      this.size,
      required this.token,
      required this.open,
      required this.quantity})
      : super(key: key);
  final title;

  final des;

  final price;

  final image;

  final quantity;

  final token;

  final stock;

  final lat;

  final open;

  final long;

  final cat;

  final size;

  @override
  State<cart_button> createState() => _cart_buttonState();
}

class _cart_buttonState extends State<cart_button> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(user.cart.any((element) => element['title'] == widget.title));
    if (user.cart.any((element) => element['title'] == widget.title) == true) {
      is_added = true;
    } else {
      is_added = false;
    }
  }

  bool is_added = false;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          is_added = !is_added;
          if (is_added == true) {
            if (user.is_login == true) {
              if (widget.stock == "In Stock") {
                if (widget.open == true) {
                  user.new_order = true;
                  var price = widget.price.split(" ")[1];
                  print(price);
                  print("Cat - ${widget.cat}");
                  var product = {
                    "title": widget.title,
                    "des": widget.des,
                    "price": price,
                    "image": widget.image,
                    "stock": widget.stock,
                    "lat": widget.lat,
                    "long": widget.long,
                    "cat": widget.cat,
                    "size": widget.size,
                    "token": widget.token,
                    "shop_status": widget.open,
                    "quantity": 1,
                    'drop_location_lat': "${user.lat}",
                    'drop_location_long': "${user.long}"
                  };
                  user.cart.add(product);
                  var prev_price = user.cart_price;
                  // cart_button_state.setState(() {
                  //   cart_button_state.number = "${user.cart.length}";
                  //   cart_button_state.update();
                  // });
                  user.cart_price = prev_price + int.parse(price);
                  cart_controller.cart_update();
                } else {
                  Get.snackbar("Shop is Closed", "Can't add to cart");
                  is_added = false;
                }
              } else {
                is_added = false;
                Get.snackbar("Out of Stock", "Can't add to cart");
              }
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => login()));
            }
          } else {
            if (user.is_login == true) {
              var price = widget.price.split(" ")[1];
              var prev_price = user.cart_price;
              print(price);
              print("Cat - ${widget.cat}");
              user.cart
                  .removeWhere((element) => element["title"] == widget.title);
              user.cart_price = prev_price - int.parse(price);
              // cart_button_state.setState(() {
              //   cart_button_state.number = "${user.cart.length}";
              //   cart_button_state.update();
              // });
              cart_controller.cart_update();
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => login()));
            }
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 60,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: is_added ? ColorHelper.color[8] : ColorHelper.color[0],
            boxShadow: [
              BoxShadow(color: ColorHelper.color[1], blurRadius: 20.0),
            ]),
        child: Center(
          child: is_added
              ? Icon(
                  IconHelper.icons[11],
                  color: ColorHelper.color[0],
                )
              : Icon(
                  IconHelper.icons[6],
                  color: ColorHelper.color[1],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:web_grofy/pages/registration/login/login.dart';

import '../constrants/Icons.dart';
import '../constrants/color.dart';
import '../controllers/cart/cart controller.dart';
import '../user/user.dart';


class like_btn extends StatefulWidget {
  const like_btn(
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
      required this.open})
      : super(key: key);
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
  State<like_btn> createState() => _like_btnState();
}

class _like_btnState extends State<like_btn> {
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
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8),
      child: Align(
          alignment: Alignment.centerRight,
          child: like == true
              ? InkWell(
                  onTap: () {
                    print("Changed");
                    if (user.is_login == true) {
                      setState(() {
                        var prev_price = user.cart_price;
                        like = false;
                        user.cart
                            .removeWhere((element) => element["title"] == widget.title);
                        user.cart_price = prev_price - int.parse(widget.price);
                        print(user.cart);
                        print(user.cart.length);
                        // cart_button_state.setState(() {
                        //   cart_button_state.number = "${user.cart.length}";
                        //   cart_button_state.update();
                        // });
                        cart_controller.cart_update();
                      });
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => login()));
                    }
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        IconHelper.icons[16],
                        color: ColorHelper.color[4],
                      )),
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
                      height: 40,
                      width: 40,
                      child: Icon(
                        IconHelper.icons[15],
                        color: ColorHelper.color[1],
                      )),
                )),
    );
  }
}

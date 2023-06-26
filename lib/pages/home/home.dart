import 'package:flutter/material.dart';

import '../../constrants/Icons.dart';
import '../../constrants/color.dart';
import '../../controllers/assets/assets.dart';
import '../../controllers/home/home_controller.dart';
import '../../staful widget/add_btn.dart';
import '../../widgets/appbar.dart';
import '../../widgets/category card.dart';
import '../../widgets/home page loader.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.color[0],
      body: SingleChildScrollView(
        child: Column(
          children: [
            app_bar(context),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 14, left: 12),
                child: Text(
                  "Shop by categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const pet_care()));
                          },
                          child: category_card(
                            image: assets.pet_care,
                            title: "Pet Care",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const personal_care()));
                          },
                          child: category_card(
                            image: assets.personal_care,
                            title: "Personal Care",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const cleaning_essentials()));
                          },
                          child: category_card(
                            image: assets.cleaning_essentials,
                            title: "Cleaning Essentials",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const frozen_food()));
                          },
                          child: category_card(
                            image: assets.frozen_food,
                            title: "Frozen & Packed Food",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const pet_care()));
                          },
                          child: category_card(
                            image: assets.fruits_veges,
                            title: "Fruits & Vegetables",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const personal_care()));
                          },
                          child: category_card(
                            image: assets.dairy_breakfast,
                            title: "Dairy & Breakfast",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const cleaning_essentials()));
                          },
                          child: category_card(
                            image: assets.munchies,
                            title: "Munchies",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const frozen_food()));
                          },
                          child: category_card(
                            image: assets.coldDrinks,
                            title: "Cold Drinks & Juices",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const personal_care()));
                          },
                          child: category_card(
                            image: assets.bakery,
                            title: "Bakery",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const cleaning_essentials()));
                          },
                          child: category_card(
                            image: assets.masala_dry_fruits,
                            title: "Masala & Dry Fruits",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const frozen_food()));
                          },
                          child: category_card(
                            image: assets.sweetooth,
                            title: "Sweet Tooth",
                          )),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const frozen_food()));
                          },
                          child: category_card(
                            image: assets.atta,
                            title: "Atta, Rice & Dal",
                          )),
                    )),
              ],
            ),
            Divider(
              color: ColorHelper.color[1],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Summer Special",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            ),

            FutureBuilder(
                future: home_controller.load_summer(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: home_page_loader());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return snapshot.data == null
                        ? Container(
                      height: 300,
                      width: 500,
                      child: Center(
                        child: Text(
                          "Nothing to show. Come back later !",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorHelper.color[1]),
                        ),
                      ),
                    )
                        : Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             product_info(
                                      //               token: snapshot
                                      //                   .data[index]
                                      //               ["token"],
                                      //               title: snapshot
                                      //                   .data[index]
                                      //               ["title"],
                                      //               price:
                                      //               "₹ ${snapshot.data[index]["price"]}",
                                      //               image: snapshot
                                      //                   .data[index]
                                      //               ["image"],
                                      //               stock: snapshot
                                      //                   .data[index]
                                      //               ["stock"],
                                      //               des: snapshot
                                      //                   .data[index]
                                      //               ["description"],
                                      //               lat: snapshot
                                      //                   .data[index]
                                      //               ["lat"],
                                      //               long: snapshot
                                      //                   .data[index]
                                      //               ["long"],
                                      //               open: snapshot
                                      //                   .data[index]
                                      //               ["shop_status"],
                                      //             )));
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 140,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                border: Border.all(
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.40))),
                                            child: Center(
                                                child: Image.memory(snapshot.data[index]["image"])),
                                          ),

                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8, top: 8),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: Container(
                                                height: 25,
                                                width: 74,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            4)),
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.10)),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      IconHelper
                                                          .icons[29],
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Text(
                                                      "39 MINS",
                                                      style: TextStyle(
                                                          letterSpacing:
                                                          0.50,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Text(
                                              snapshot.data[index]
                                              ["title"],
                                              style: const TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "₹${snapshot.data[index]["price"]}",
                                                  style: TextStyle(
                                                      color: ColorHelper
                                                          .color[2]),
                                                ),
                                                Expanded(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .centerRight,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(2.0),
                                                        child: cart_btn(
                                                          title: snapshot
                                                              .data[index]
                                                          ["title"],
                                                          des: snapshot
                                                              .data[index]
                                                          ["des"],
                                                          price: snapshot
                                                              .data[index]
                                                          ["price"],
                                                          image: snapshot
                                                              .data[index]
                                                          ["image"],
                                                          stock: snapshot
                                                              .data[index]
                                                          ["stock"],
                                                          lat: snapshot
                                                              .data[index]
                                                          ["lat"],
                                                          long: snapshot
                                                              .data[index]
                                                          ["long"],
                                                          token: snapshot
                                                              .data[index]
                                                          ["token"],
                                                          open: snapshot
                                                              .data[index]
                                                          ["shop_status"],
                                                          cat: null,
                                                          size: null,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            }));
                  }
                }),
            Divider(
              color: ColorHelper.color[1],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fruits & Veggies for you",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            ),

            FutureBuilder(
                future: home_controller.load_fruits_veges(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: home_page_loader());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return snapshot.data == null
                        ? Container(
                      height: 300,
                      width: 500,
                      child: Center(
                        child: Text(
                          "Nothing to show. Come back later !",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorHelper.color[1]),
                        ),
                      ),
                    )
                        : Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             product_info(
                                      //               token: snapshot
                                      //                   .data[index]
                                      //               ["token"],
                                      //               title: snapshot
                                      //                   .data[index]
                                      //               ["title"],
                                      //               price:
                                      //               "₹ ${snapshot.data[index]["price"]}",
                                      //               image: snapshot
                                      //                   .data[index]
                                      //               ["image"],
                                      //               stock: snapshot
                                      //                   .data[index]
                                      //               ["stock"],
                                      //               des: snapshot
                                      //                   .data[index]
                                      //               ["description"],
                                      //               lat: snapshot
                                      //                   .data[index]
                                      //               ["lat"],
                                      //               long: snapshot
                                      //                   .data[index]
                                      //               ["long"],
                                      //               open: snapshot
                                      //                   .data[index]
                                      //               ["shop_status"],
                                      //             )));
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 140,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                border: Border.all(
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.40))),
                                            child: Center(
                                                child: Image.memory(
                                                    snapshot.data[index]
                                                    ["image"])),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8, top: 8),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: Container(
                                                height: 25,
                                                width: 74,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            4)),
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.10)),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      IconHelper
                                                          .icons[29],
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Text(
                                                      "39 MINS",
                                                      style: TextStyle(
                                                          letterSpacing:
                                                          0.50,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Text(
                                              snapshot.data[index]
                                              ["title"],
                                              style: const TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "₹${snapshot.data[index]["price"]}",
                                                  style: TextStyle(
                                                      color: ColorHelper
                                                          .color[2]),
                                                ),
                                                Expanded(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .centerRight,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(2.0),
                                                        child: cart_btn(
                                                          title: snapshot
                                                              .data[index]
                                                          ["title"],
                                                          des: snapshot
                                                              .data[index]
                                                          ["des"],
                                                          price: snapshot
                                                              .data[index]
                                                          ["price"],
                                                          image: snapshot
                                                              .data[index]
                                                          ["image"],
                                                          stock: snapshot
                                                              .data[index]
                                                          ["stock"],
                                                          lat: snapshot
                                                              .data[index]
                                                          ["lat"],
                                                          long: snapshot
                                                              .data[index]
                                                          ["long"],
                                                          token: snapshot
                                                              .data[index]
                                                          ["token"],
                                                          open: snapshot
                                                              .data[index]
                                                          ["shop_status"],
                                                          cat: null,
                                                          size: null,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            }));
                  }
                }),
            Divider(
              color: ColorHelper.color[1],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Party Special",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            ),

            FutureBuilder(
                future: home_controller.load_frozen(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: home_page_loader());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return snapshot.data == null
                        ? Container(
                      height: 300,
                      width: 500,
                      child: Center(
                        child: Text(
                          "Nothing to show. Come back later !",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorHelper.color[1]),
                        ),
                      ),
                    )
                        : Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             product_info(
                                      //               token: snapshot
                                      //                   .data[index]
                                      //               ["token"],
                                      //               title: snapshot
                                      //                   .data[index]
                                      //               ["title"],
                                      //               price:
                                      //               "₹ ${snapshot.data[index]["price"]}",
                                      //               image: snapshot
                                      //                   .data[index]
                                      //               ["image"],
                                      //               stock: snapshot
                                      //                   .data[index]
                                      //               ["stock"],
                                      //               des: snapshot
                                      //                   .data[index]
                                      //               ["description"],
                                      //               lat: snapshot
                                      //                   .data[index]
                                      //               ["lat"],
                                      //               long: snapshot
                                      //                   .data[index]
                                      //               ["long"],
                                      //               open: snapshot
                                      //                   .data[index]
                                      //               ["shop_status"],
                                      //             )));
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 140,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                border: Border.all(
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.40))),
                                            child: Center(
                                                child: Image.memory(
                                                    snapshot.data[index]
                                                    ["image"])),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8, top: 8),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: Container(
                                                height: 25,
                                                width: 74,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            4)),
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.10)),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      IconHelper
                                                          .icons[29],
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Text(
                                                      "39 MINS",
                                                      style: TextStyle(
                                                          letterSpacing:
                                                          0.50,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Text(
                                              snapshot.data[index]
                                              ["title"],
                                              style: const TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "₹${snapshot.data[index]["price"]}",
                                                  style: TextStyle(
                                                      color: ColorHelper
                                                          .color[2]),
                                                ),
                                                Expanded(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .centerRight,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(2.0),
                                                        child: cart_btn(
                                                          title: snapshot
                                                              .data[index]
                                                          ["title"],
                                                          des: snapshot
                                                              .data[index]
                                                          ["des"],
                                                          price: snapshot
                                                              .data[index]
                                                          ["price"],
                                                          image: snapshot
                                                              .data[index]
                                                          ["image"],
                                                          stock: snapshot
                                                              .data[index]
                                                          ["stock"],
                                                          lat: snapshot
                                                              .data[index]
                                                          ["lat"],
                                                          long: snapshot
                                                              .data[index]
                                                          ["long"],
                                                          token: snapshot
                                                              .data[index]
                                                          ["token"],
                                                          open: snapshot
                                                              .data[index]
                                                          ["shop_status"],
                                                          cat: null,
                                                          size: null,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            }));
                  }
                }),
            Divider(
              color: ColorHelper.color[1],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Morning Freshness",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            ),

            FutureBuilder(
                future: home_controller.load_breakfast(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: home_page_loader());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return snapshot.data == null
                        ? Container(
                      height: 300,
                      width: 500,
                      child: Center(
                        child: Text(
                          "Nothing to show. Come back later !",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorHelper.color[1]),
                        ),
                      ),
                    )
                        : Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             product_info(
                                      //               token: snapshot
                                      //                   .data[index]
                                      //               ["token"],
                                      //               title: snapshot
                                      //                   .data[index]
                                      //               ["title"],
                                      //               price:
                                      //               "₹ ${snapshot.data[index]["price"]}",
                                      //               image: snapshot
                                      //                   .data[index]
                                      //               ["image"],
                                      //               stock: snapshot
                                      //                   .data[index]
                                      //               ["stock"],
                                      //               des: snapshot
                                      //                   .data[index]
                                      //               ["description"],
                                      //               lat: snapshot
                                      //                   .data[index]
                                      //               ["lat"],
                                      //               long: snapshot
                                      //                   .data[index]
                                      //               ["long"],
                                      //               open: snapshot
                                      //                   .data[index]
                                      //               ["shop_status"],
                                      //             )));
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 140,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                border: Border.all(
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.40))),
                                            child: Center(
                                                child: Image.memory(
                                                    snapshot.data[index]
                                                    ["image"])),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8, top: 8),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: Container(
                                                height: 25,
                                                width: 74,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            4)),
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.10)),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      IconHelper
                                                          .icons[29],
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Text(
                                                      "39 MINS",
                                                      style: TextStyle(
                                                          letterSpacing:
                                                          0.50,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Text(
                                              snapshot.data[index]
                                              ["title"],
                                              style: const TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "₹${snapshot.data[index]["price"]}",
                                                  style: TextStyle(
                                                      color: ColorHelper
                                                          .color[2]),
                                                ),
                                                Expanded(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .centerRight,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(2.0),
                                                        child: cart_btn(
                                                          title: snapshot
                                                              .data[index]
                                                          ["title"],
                                                          des: snapshot
                                                              .data[index]
                                                          ["des"],
                                                          price: snapshot
                                                              .data[index]
                                                          ["price"],
                                                          image: snapshot
                                                              .data[index]
                                                          ["image"],
                                                          stock: snapshot
                                                              .data[index]
                                                          ["stock"],
                                                          lat: snapshot
                                                              .data[index]
                                                          ["lat"],
                                                          long: snapshot
                                                              .data[index]
                                                          ["long"],
                                                          token: snapshot
                                                              .data[index]
                                                          ["token"],
                                                          open: snapshot
                                                              .data[index]
                                                          ["shop_status"],
                                                          cat: null,
                                                          size: null,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            }));
                  }
                }),
            Divider(
              color: ColorHelper.color[1],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Daily Use",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            ),

            FutureBuilder(
                future: home_controller.load_daily(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: home_page_loader());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else {
                    return snapshot.data == null
                        ? Container(
                      height: 300,
                      width: 500,
                      child: Center(
                        child: Text(
                          "Nothing to show. Come back later !",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorHelper.color[1]),
                        ),
                      ),
                    )
                        : Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             product_info(
                                      //               token: snapshot
                                      //                   .data[index]
                                      //               ["token"],
                                      //               title: snapshot
                                      //                   .data[index]
                                      //               ["title"],
                                      //               price:
                                      //               "₹ ${snapshot.data[index]["price"]}",
                                      //               image: snapshot
                                      //                   .data[index]
                                      //               ["image"],
                                      //               stock: snapshot
                                      //                   .data[index]
                                      //               ["stock"],
                                      //               des: snapshot
                                      //                   .data[index]
                                      //               ["description"],
                                      //               lat: snapshot
                                      //                   .data[index]
                                      //               ["lat"],
                                      //               long: snapshot
                                      //                   .data[index]
                                      //               ["long"],
                                      //               open: snapshot
                                      //                   .data[index]
                                      //               ["shop_status"],
                                      //             )));
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 140,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(
                                                        10)),
                                                border: Border.all(
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.40))),
                                            child: Center(
                                                child: Image.memory(
                                                    snapshot.data[index]
                                                    ["image"])),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8, top: 8),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: Container(
                                                height: 25,
                                                width: 74,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            4)),
                                                    color: ColorHelper
                                                        .color[1]
                                                        .withOpacity(
                                                        0.10)),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      IconHelper
                                                          .icons[29],
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Text(
                                                      "39 MINS",
                                                      style: TextStyle(
                                                          letterSpacing:
                                                          0.50,
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Text(
                                              snapshot.data[index]
                                              ["title"],
                                              style: const TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "₹${snapshot.data[index]["price"]}",
                                                  style: TextStyle(
                                                      color: ColorHelper
                                                          .color[2]),
                                                ),
                                                Expanded(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .centerRight,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(2.0),
                                                        child: cart_btn(
                                                          title: snapshot
                                                              .data[index]
                                                          ["title"],
                                                          des: snapshot
                                                              .data[index]
                                                          ["des"],
                                                          price: snapshot
                                                              .data[index]
                                                          ["price"],
                                                          image: snapshot
                                                              .data[index]
                                                          ["image"],
                                                          stock: snapshot
                                                              .data[index]
                                                          ["stock"],
                                                          lat: snapshot
                                                              .data[index]
                                                          ["lat"],
                                                          long: snapshot
                                                              .data[index]
                                                          ["long"],
                                                          token: snapshot
                                                              .data[index]
                                                          ["token"],
                                                          open: snapshot
                                                              .data[index]
                                                          ["shop_status"],
                                                          cat: null,
                                                          size: null,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            }));
                  }
                }),
          ],
        ),
      ),
    );
  }
}

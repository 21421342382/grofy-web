import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../constrants/Icons.dart';
import '../constrants/color.dart';
import '../controllers/assets/assets.dart';
import '../controllers/home/home_controller.dart';
import 'add_btn.dart';
import 'like_btn.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  var _foundUsers = [];

  initState() {
    // at the beginning, all users are shown
    _foundUsers = home_controller.all_item;
    super.initState();
    _foundUsers = home_controller.all_item;
  }

  var results = [];

  void _runFilter(String enteredKeyword) {
    var results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = home_controller.all_item;
    } else {
      print(home_controller.all_item[0]["title"]);
      results = home_controller.all_item
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  TextEditingController word = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            color: ColorHelper.color[0],
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 20,top: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: ColorHelper.color[1].withOpacity(0.40),width: 2)
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 8,),
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(IconHelper.icons[7])),
                        SizedBox(width: 8,),
                        Expanded(child: TextFormField(
                          onChanged: (value) => _runFilter(value),
                          controller: word,
                          cursorColor: ColorHelper.color[2],
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration.collapsed(
                              hintText: "Search for atta, onions, dal and more",
                              hintStyle: TextStyle(color: ColorHelper.color[1])
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          word.text.isNotEmpty
          ?Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8,top: 8),
                child: Text('Showing results for "${word.text}"',style: TextStyle(fontWeight: FontWeight.bold),),
              ))
          : Container(),
          SizedBox(height: 10,),
          Expanded(
            child: _foundUsers.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Image.asset(assets.nothing_found),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: _foundUsers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: context.isPhone ? 2 : 7,
                            mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => product_info(
                                  //       token: _foundUsers[index]["token"],
                                  //           title: _foundUsers[index]["title"],
                                  //           price:
                                  //               "₹ ${_foundUsers[index]["price"]}",
                                  //           image: _foundUsers[index]["image"],
                                  //           stock: _foundUsers[index]["stock"],
                                  //           des: _foundUsers[index]
                                  //               ["description"],
                                  //           lat: _foundUsers[index]["lat"],
                                  //           long: _foundUsers[index]["long"], open: _foundUsers[index]["shop_status"],
                                  //         )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorHelper.color[0],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 8,
                                          ),
                                          _foundUsers[index]["stock"] ==
                                                  "In Stock"
                                              ? Container(
                                            height: 50,
                                            width: 30,
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.all(Radius.circular(2)),
                                            //   color: ColorHelper.color[3]
                                            // ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(1.0),
                                                // child: Text("free delivery",style: TextStyle(color: ColorHelper.color[0]),),
                                              ),
                                            ),
                                          )
                                              : Text(
                                                  "* out of stock",
                                                  style: TextStyle(
                                                      color:
                                                          ColorHelper.color[4]),
                                                ),
                                          Expanded(child: like_btn(title: _foundUsers[index]["title"], des: _foundUsers[index]["des"], price: _foundUsers[index]["price"], image: _foundUsers[index]["image"], stock: _foundUsers[index]["stock"], lat: _foundUsers[index]["lat"], long: _foundUsers[index]["long"], token: _foundUsers[index]["token"], open: _foundUsers[index]["shop_status"],)),
                                        ],
                                      ),
                                      Container(
                                          height: 134,
                                          width: 134,
                                          // decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.all(
                                          //         Radius.circular(80)),
                                          //     color: _foundUsers[index]
                                          //                 ["stock"] ==
                                          //             "In Stock"
                                          //         ? ColorHelper.color[3]
                                          //             .withOpacity(0.40)
                                          //         : ColorHelper.color[4]
                                          //             .withOpacity(0.40)),
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              // decoration: BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.all(
                                              //             Radius.circular(80)),
                                              //     color: _foundUsers[index]
                                              //                 ["stock"] ==
                                              //             "In Stock"
                                              //         ? ColorHelper.color[3]
                                              //             .withOpacity(0.85)
                                              //         : ColorHelper.color[4]
                                              //             .withOpacity(0.85)),
                                              child: Center(
                                                child: Image.memory(
                                                  _foundUsers[index]["image"],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          )),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 5, right: 5, top: 5),
                                      //   child: Text(
                                      //     _foundUsers[index]["title"],
                                      //     overflow: TextOverflow.ellipsis,
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.bold,
                                      //         color: ColorHelper.r_g_b[3]),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 5, right: 5, top: 5),
                                      //   child: Text(
                                      //     "₹ ${_foundUsers[index]["price"]}",
                                      //     overflow: TextOverflow.ellipsis,
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.bold,
                                      //         color: ColorHelper.color[2]),
                                      //   ),
                                      // )
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: 25,
                                            width: 74,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(4)),
                                              color: ColorHelper.color[1].withOpacity(0.10)
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 2,),
                                                Icon(IconHelper.icons[29],size: 20,),
                                                SizedBox(width: 3,),
                                                Text("39 MINS",style: TextStyle(letterSpacing : 0.50,fontSize: 10,fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                                        child: Text(_foundUsers[index]["title"],style: TextStyle(fontWeight: FontWeight.bold),maxLines: 2,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8,right: 8),
                                        child: Row(
                                          children: [
                                            Text("₹${_foundUsers[index]["price"]}",style: TextStyle(color: ColorHelper.color[2]),),
                                            Expanded(
                                                child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: cart_btn(title: _foundUsers[index]["title"], des: _foundUsers[index]["des"], price: _foundUsers[index]["price"], image: _foundUsers[index]["image"], stock: _foundUsers[index]["stock"], lat: _foundUsers[index]["lat"], long: _foundUsers[index]["long"], token: _foundUsers[index]["token"], open: _foundUsers[index]["shop_status"], cat: null, size: null,),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }),
                  ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../pages/home/home.dart';
import '../../user/user.dart';


class bug_controller{
  static var imagepath;

  static var imageFile;
  static var byte_image;

  static bool is_image = false;

  static TextEditingController bug_description = new TextEditingController();
  static void get_image(context) async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imagepath = pickedImage.path;
        imageFile = await pickedImage.readAsBytes();
        byte_image = await pickedImage.readAsBytes();
        is_image = true;
        // Navigator.of(context)
        //     .pushReplacement(MaterialPageRoute(builder: (context) => report_bug()));
      }
    } catch (e) {}
  }

  static submit_bug(context) async{
    EasyLoading.showProgress(status: "Uploading" , 0.30);
    final todo = ParseObject('bugs')..set('image', byte_image)..set('description', bug_description.text)..set('user', user.username)..set('email', user.email)..set('price', 0)..set('location', user.location);
    await todo.save();
    EasyLoading.showProgress(status: "Uploading" , 0.90);
    EasyLoading.dismiss();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => home()), (route) => false);
  }

}
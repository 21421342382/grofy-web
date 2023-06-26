import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/home/home.dart';
import '../../pages/registration/login/login.dart';
import '../../user/user.dart';

class account_controller{
  static TextEditingController name = new TextEditingController();
  static TextEditingController email = new TextEditingController();
  static TextEditingController location = new TextEditingController();
  ////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////
  final picker = ImagePicker();
  var cmpressed_image ;

  static change_name(context) async{
    EasyLoading.showProgress(0.30, status: 'Making Changes...');

    if(name.text == ""){
      Get.snackbar(
          "Something went wrong !",
          "Enter name correctly"
      );
      EasyLoading.dismiss();
    }else{
      EasyLoading.showProgress(0.50, status: 'Making Changes...');
      user.username = name.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("name", user.username);
      var todo1 = ParseObject('users')
        ..objectId = user.obj_id
        ..set('username', user.username);
      await todo1.save();
      EasyLoading.showProgress(0.100, status: 'Making Changes...');
      print("Name Changed Successfull");
      Get.snackbar(
          "Name Changed !",
          "Name Changed Successfully"
      );
      EasyLoading.dismiss();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => home()), (route) => false);

    }
  }


  static change_email(context) async{
    EasyLoading.showProgress(0.30, status: 'Making Changes...');
      if(email.text == ""){
        Get.snackbar(
            "Something went wrong !",
            "Enter email correctly"
        );
        EasyLoading.dismiss();
      }else{
        user.email = email.text;
        var todo1 = ParseObject('users')
          ..objectId = user.obj_id
          ..set('email', user.email);
        await todo1.save();
        EasyLoading.showProgress(0.90, status: 'Making Changes...');
        print("Name Changed Successfull");
        Get.snackbar(
            "Email Changed !",
            "Email Changed Successfully"
        );
        EasyLoading.showProgress(0.100, status: 'Making Changes...');
        EasyLoading.dismiss();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => home()), (route) => false);

      }
  }

  static logout(context) async{
    EasyLoading.showProgress(0.30, status: 'Making Changes...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("login");
    EasyLoading.showProgress(0.80, status: 'Making Changes...');
    prefs.remove("name");
    EasyLoading.showProgress(0.100, status: 'Making Changes...');
    EasyLoading.dismiss();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login()), (route) => false);

  }

  static delete_account(context) async{

    var obj ;

    EasyLoading.showProgress(0.30, status: 'Making Changes...');
    var todo2 = ParseObject('users')..objectId = user.obj_id;
    await todo2.delete();
    //////////////////////////////////// SELLER ACCOUNT DELETED /////////////////////////////////////////////
    // final QueryBuilder<ParseObject> parseQuery =
    // QueryBuilder<ParseObject>(ParseObject('tokens'));
    // // `whereContains` is a basic query method that checks if string field
    // // contains a specific substring
    // parseQuery.whereContains('token', user.secret_key);
    //
    // // The query will resolve only after calling this method, retrieving
    // // an array of `ParseObjects`, if success
    // final ParseResponse apiResponse = await parseQuery.query();
    //
    // if (apiResponse.success && apiResponse.results != null) {
    //   for (var o in apiResponse.results!) {
    //     var data = apiResponse.results as List<ParseObject>;
    //     obj = data[0]["objectId"];
    //     print(obj);
    //   }
    // }else{
    // }
    // var todo3 = ParseObject('tokens')..objectId = obj;
    // await todo3.delete();
    // print(obj);
    // print("Done !! ");
    EasyLoading.showProgress(0.60, status: 'Making Changes...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("login");
    prefs.remove("name");
    EasyLoading.showProgress(0.80, status: 'Making Changes...');
    user.has_profile_photo = false;
    user.profile_photo = "";
    EasyLoading.showProgress(0.100, status: 'Making Changes...');
    EasyLoading.dismiss();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login()), (route) => false);

  }

  static update_profile_photo(context) async{
    EasyLoading.showProgress(0.30, status: 'Making Changes...');
    print(user.profile_photo);
    print(user.has_profile_photo);
    print(user.obj_id);
    EasyLoading.showProgress(0.50, status: 'Making Changes...');
    var todo = ParseObject('users')
      ..objectId = user.obj_id
      ..set('profile_photo', user.profile_photo);
    await todo.save();
    print("Profile Photo Saved");
    EasyLoading.showProgress(0.100, status: 'Making Changes...');
    EasyLoading.dismiss();
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => account()), (route) => false);

  }

  take_image(context) async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      try {
        cmpressed_image = await FlutterImageCompress.compressWithFile(
            pickedFile.path,
            format: CompressFormat.heic,
            quality: 70
        );

      } catch (e) {
        cmpressed_image = await FlutterImageCompress.compressWithFile(
            pickedFile.path,
            format: CompressFormat.jpeg,
            quality: 70
        );


      }
      print(cmpressed_image);
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => take_image_and_upload(img: cmpressed_image,)));
    }

  }



}
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../user/user.dart';

class cart_controller{

  static cart_update()async{
    if(user.is_login == true){
      var todo1 = ParseObject('users')
        ..objectId = user.obj_id
        ..set('cart', user.cart)
        ..set('price', user.cart_price);
      await todo1.save();
    }else{
      return ;
    }
  }

  static remove_cart() async{
    if(user.is_login == true){
      var todo1 = ParseObject('users')
        ..objectId = user.obj_id
        ..set('cart', [])
        ..set('price', 0);
      await todo1.save();
    }else{
      return ;
    }
  }

}
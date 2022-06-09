import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/models/cart.dart';
import 'package:mobile_ui/models/user.dart';


class CartController {
  CartController._();
  static Future< List<Cart> > getCarts(int user_id) async {   
    List<Cart> carts = [];
    String cartsAdd = "/carts";
    BaseAPI _baseAPI = BaseAPI();
    await _baseAPI.getData(cartsAdd, params: {'user_id' : user_id}).then((value) {
      if (value.apiStatus == API_STATUS.SUSSCESSED) {
        
        value.object.forEach((element) {
         
          carts.add(Cart.fromJson(element));
        });
      }
    });
    return carts;
  }
  static Future<bool> addCart(Cart cart) async {
    String addCart = "/cart";
    BaseAPI _baseAPI = BaseAPI();
    Map<String, dynamic> body = {
      'user_id': cart.userId,
      'product_id': cart.productId,
      'cart_product_size': cart.cartProductSize,
      'cart_product_quantity': cart.cartProductQuantity,     
    };
    var res = await _baseAPI.postData(addCart, body: body);
    if (res.apiStatus == API_STATUS.SUSSCESSED) {
      return true;
    }
    return false;
  }
  static Future<bool> delCart(Cart cart) async {
    String delCart = "/delCart";
    BaseAPI _baseAPI = BaseAPI();
    Map<String, dynamic> body = {
      'user_id': cart.userId,
      'product_id': cart.productId,
      'cart_product_size': cart.cartProductSize,  
    };
    var res = await _baseAPI.postData(delCart, body: body);
    if (res.apiStatus == API_STATUS.SUSSCESSED) {
      return true;
    }
    return false;
  }
  static Future<bool> updateCart(Cart cart) async {
    String updateCart = "/updateCart";
    BaseAPI _baseAPI = BaseAPI();
    Map<String, dynamic> body = {
      'cart_product_quantity': cart.cartProductQuantity, 
      'user_id': cart.userId,
      'product_id': cart.productId,
      'cart_product_size': cart.cartProductSize,  
    };
    var res = await _baseAPI.postData(updateCart, body: body);
    if (res.apiStatus == API_STATUS.SUSSCESSED) {
      return true;
    }
    return false;
  }
}

import 'dart:convert';

class Cart {
    Cart({
        this.userId,
        this.productId,
        this.cartProductSize,
        this.cartProductQuantity,
        this.productName,
        this.productImg,
        this.productPrice,
    });

    int? userId;
    int? productId;
    String? cartProductSize;
    int? cartProductQuantity;
    String? productName;
    String? productImg;
    int? productPrice;

    factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        userId: json["user_id"],
        productId: json["product_id"],
        cartProductSize: json["cart_product_size"],
        cartProductQuantity: json["cart_product_quantity"],
        productName: json["product_name"],
        productImg: json["product_img"],
        productPrice: json["product_price"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
        "cart_product_size": cartProductSize,
        "cart_product_quantity": cartProductQuantity,
        "product_name": productName,
        "product_img": productImg,
        "product_price": productPrice,
    };
}

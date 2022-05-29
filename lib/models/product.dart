// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

class Product {
  Product({
    this.productId,
    this.productName,
    this.productIntroduce,
    this.productDetail,
    this.productPrice,
    this.productImg,
    this.productLocation,
    this.productMaterial,
    this.productTypeId,
    this.productSize,
  });

  int? productId;
  String? productName;
  String? productIntroduce;
  String? productDetail;
  int? productPrice;
  String? productImg;
  String? productLocation;
  String? productMaterial;
  int? productTypeId;
  String? productSize;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"],
        productIntroduce: json["product_introduce"],
        productDetail: json["product_detail"],
        productPrice: json["product_price"],
        productImg: json["product_img"],
        productLocation: json["product_location"],
        productMaterial: json["product_material"],
        productTypeId: json["product_type_id"],
        productSize: json["product_size"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_introduce": productIntroduce,
        "product_detail": productDetail,
        "product_price": productPrice,
        "product_img": productImg,
        "product_location": productLocation,
        "product_material": productMaterial,
        "product_type_id": productTypeId,
        "product_size": productSize,
      };
}

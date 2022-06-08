// To parse this JSON data, do
//
//     final invoice = invoiceFromJson(jsonString);

import 'dart:convert';

class Invoice {
    Invoice({
        this.invoiceId,
        this.userId,
        this.invoiceTotalPayment,
        this.invoiceCreatedAt,
        this.listDetails,
    });

    int? invoiceId;
    int? userId;
    int? invoiceTotalPayment;
    DateTime? invoiceCreatedAt;
    List<ListDetail>? listDetails;

    factory Invoice.fromRawJson(String str) => Invoice.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        invoiceId: json["invoice_id"],
        userId: json["user_id"],
        invoiceTotalPayment: json["invoice_total_payment"],
        invoiceCreatedAt: DateTime.parse(json["invoice_created_at"]),
        listDetails: List<ListDetail>.from(json["list_details"].map((x) => ListDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "invoice_id": invoiceId,
        "user_id": userId,
        "invoice_total_payment": invoiceTotalPayment,
        "invoice_created_at": invoiceCreatedAt,
        "list_details": List<dynamic>.from(listDetails!.map((x) => x.toJson())),
    };
}

class ListDetail {
    ListDetail({
        this.invoiceId,
        this.detailProductQuantity,
        this.detailProductSize,
        this.productId,
        this.productName,
        this.productIntroduce,
        this.productDetail,
        this.productPrice,
        this.productImg,
        this.productQuantity,
        this.productLocation,
        this.productMaterial,
        this.productTypeId,
        this.productSize,
    });

    int? invoiceId;
    int? detailProductQuantity;
    String? detailProductSize;
    int? productId;
    String? productName;
    String? productIntroduce;
    String? productDetail;
    int? productPrice;
    String? productImg;
    int? productQuantity;
    String? productLocation;
    String? productMaterial;
    int? productTypeId;
    String? productSize;

    factory ListDetail.fromRawJson(String str) => ListDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDetail.fromJson(Map<String, dynamic> json) => ListDetail(
        invoiceId: json["invoice_id"],
        detailProductQuantity: json["detail_product_quantity"],
        detailProductSize: json["detail_product_size"],
        productId: json["product_id"],
        productName: json["product_name"],
        productIntroduce: json["product_introduce"],
        productDetail: json["product_detail"],
        productPrice: json["product_price"],
        productImg: json["product_img"],
        productQuantity: json["product_quantity"],
        productLocation: json["product_location"],
        productMaterial: json["product_material"],
        productTypeId: json["product_type_id"],
        productSize: json["product_size"],
    );

    Map<String, dynamic> toJson() => {
        "invoice_id": invoiceId,
        "detail_product_quantity": detailProductQuantity,
        "detail_product_size": detailProductSize,
        "product_id": productId,
        "product_name": productName,
        "product_introduce": productIntroduce,
        "product_detail": productDetail,
        "product_price": productPrice,
        "product_img": productImg,
        "product_quantity": productQuantity,
        "product_location": productLocation,
        "product_material": productMaterial,
        "product_type_id": productTypeId,
        "product_size": productSize,
    };
}

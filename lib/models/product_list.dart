import 'dart:convert';

class ProductList {
  String? status;
  List<Product>? productList;

  ProductList({this.status, this.productList});

  ProductList.fromJson(dynamic json) {
    status = json["status"];
    if (json['result'] != null) {
      productList = [];
      json['result'].forEach((v) {
        productList?.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["result"] = productList;

    return map;
  }
}

class Product {
  int? id;
  int? category_id;
  String? product_name;

  Product({
    this.id,
    this.category_id,
    this.product_name,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    category_id = json['category_id'];
    product_name = json['product_name'];
  }
}

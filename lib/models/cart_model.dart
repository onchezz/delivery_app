// ignore_for_file: unnecessary_this

import 'package:delivery_app/models/product.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? createdAt;
  String? exists;
  int? quantity;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.createdAt,
    this.exists,
    this.quantity,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    createdAt = json['created_at'];
    exists = json['exists'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.img,
      'price': this.price,
      'img': this.img,
      'created_at': this.exists,
      'exists': this.exists,
      'quantity': this.quantity,
      'product': this.product!.toJson(),
    };
  }
}

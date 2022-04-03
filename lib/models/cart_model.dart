// ignore_for_file: unnecessary_this

import 'package:delivery_app/models/product.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? created;
  String? time;
  bool? exists;
  int? quantity;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.created,
    this.time,
    this.exists,
    this.quantity,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    created = json['created_at'].toString();
    time = json['time'];
    exists = json['exists'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'img': this.img,
      'created_at': this.exists,
      'time': this.time,
      'exists': this.exists,
      'quantity': this.quantity,
      'product': this.product!.toJson(),
    };
  }
}

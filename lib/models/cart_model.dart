import 'package:delivery_app/models/product.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? createdAt;
  bool? exists;
  int? quantity;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.exists,
    this.price,
    this.img,
    this.createdAt,
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
}

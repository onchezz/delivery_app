class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? createdAt;
  bool? exists;
  int? quantity;

  CartModel({
    this.id,
    this.name,
    this.exists,
    this.price,
    this.img,
    this.createdAt,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    createdAt = json['created_at'];
    exists = json['exists'];
    quantity = json['quantity'];
  }
}

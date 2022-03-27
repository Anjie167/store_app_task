// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

List<Products> productsFromMap(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromMap(x)));

String productsToMap(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Products {
  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  int id;
  String title;
  double price;
  String category;
  String image;

  factory Products.fromMap(Map<String, dynamic> json) => Products(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    category: json["category"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "price": price,
    "category": category,
    "image": image,
  };
}


// Cart cartFromMap(String str) => Cart.fromMap(json.decode(str));
//
// String cartToMap(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
//
//
// class Cart {
//   Cart({
//     required this.id,
//     required this.userId,
//     required this.products,
//   });
//
//   int id;
//   int userId;
//   List<Product> products;
//
//   factory Cart.fromMap(Map<String, dynamic> json) => Cart(
//     id: json["id"],
//     userId: json["userId"],
//     products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "userId": userId ,
//     "products": List<dynamic>.from(products.map((x) => x.toMap())),
//   };
// }
//
// class Product{
//   Product({
//     required this.productId,
//     required this.quantity,
//   });
//
//   int productId;
//   int quantity;
//
//   factory Product.fromMap(Map<String, dynamic> json) => Product(
//     productId: json["productId"],
//     quantity: json["quantity"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "productId": productId,
//     "quantity": quantity,
//   };
// }
//
//

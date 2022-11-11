// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductsModel {
  int status;
  String message;
  List<Product> products;
  ProductsModel({
    required this.status,
    required this.message,
    required this.products,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      status: json["status"],
      message: json["message"],
      products:  List<Product>.from(json["products"].map((x) => Product.fromJson(x)))
        );
}

class Product {
  int id;
  String company;
  String name;
  String type;
  String price;
  String image;
  String description;
  Product({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      company: json["company"],
      name: json["name"],
      type: json["type"],
      price: json["price"],
      image: json["image"],
      description: json["description"]);
}

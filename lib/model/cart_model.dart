class CartModel {
  int? id;
  // String? productId;
  String? name;
  // int? initialPrice;
  int? price;
  String? unit;
  // String? unitTag;
  String? image;

  CartModel({
    // required this.id,
    // required this.productId,
    required this.name,
    // required this.initialPrice,
    required this.price,
    required this.unit,
    // required this.unitTag,
    required this.image,
  });

  CartModel.fromMap(Map<dynamic, dynamic> json) {
    id = json['id'];
    // productId = json['productId'];
    name = json['name'];
    // initialPrice = json['initialPrice'];
    price = json['price'];
    unit = json['unit'];
    // unitTag = json['unitTag'];
    image = json['image'];
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'productId': productId,
  //     'productName': productName,
  //     'initialPrice': initialPrice,
  //     'productPrice': productPrice,
  //     'productQuantity': productQuantity,
  //     'unitTag': unitTag,
  //     'productImage': productImage,
  //   };
  // }
}

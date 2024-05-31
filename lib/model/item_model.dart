class ItemModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final String images;

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.images,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      rating: json['rating'],
      images: json['images'][0],
    );
  }
}

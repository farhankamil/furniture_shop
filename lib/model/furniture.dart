// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final furnitureJson = furnitureJsonFromJson(jsonString);

class Furniture {
  final String name;
  final String description;
  final String pictureId;
  final num price;
  final double rating;

  Furniture({
    required this.name,
    required this.description,
    required this.pictureId,
    required this.price,
    required this.rating,
  });

  factory Furniture.fromJson(Map<String, dynamic> json) => Furniture(
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        price: json["price"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "price": price,
        "rating": rating,
      };

  @override
  String toString() {
    return 'Furniture(name: $name, description: $description, pictureId: $pictureId, price: $price, rating: $rating)';
  }
}

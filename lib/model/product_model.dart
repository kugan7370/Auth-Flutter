class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isVeg,
    required this.price,
    required this.category,
    required this.image,
    this.isAvailable,
    this.isPopular,
    this.isRecommended,
    this.isTrending,
    this.rating,
    this.reviews,
    this.deliveryTime,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String name;
  String description;
  bool isVeg;
  double price;
  String category;
  String image;
  bool? isAvailable;
  bool? isPopular;
  bool? isRecommended;
  bool? isTrending;
  double? rating;
  int? reviews;
  int? deliveryTime;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        isVeg: json["isVeg"],
        price: json["price"].toDouble(),
        category: json["category"],
        image: json["image"],
        isAvailable: json["isAvailable"],
        isPopular: json["isPopular"],
        isRecommended: json["isRecommended"],
        isTrending: json["isTrending"],
        rating: json["rating"].toDouble(),
        reviews: json["reviews"],
        deliveryTime: json["deliveryTime"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "isVeg": isVeg,
        "price": price,
        "category": category,
        "image": image,
        "isAvailable": isAvailable,
        "isPopular": isPopular,
        "isRecommended": isRecommended,
        "isTrending": isTrending,
        "rating": rating,
        "reviews": reviews,
        "deliveryTime": deliveryTime,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

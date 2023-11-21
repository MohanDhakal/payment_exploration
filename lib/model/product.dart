// {
//   "id": 2,
//   "brand": "Mango",
//   "name": "Longsleeve Violeta",
//   "color": "Orange",
//   "price": 16,
//   "size": 'S',
//   "rating_count": 5,
//   "is_favourite": true,
//   "discount_percentage": 2,
//   "image_uri": AppImages.fav1,
// },

class ProductItem {
  int id;
  String brand;
  String name;
  String color;
  double price;
  String size;
  bool inStock;
  bool inCart;

  int? ratingCount;
  bool? isFavourite;
  int? discount;
  bool inProfile;
  String imageUri;
  ProductItem({
    required this.id,
    required this.brand,
    required this.color,
    required this.name,
    required this.price,
    required this.size,
    required this.imageUri,
    required this.inStock,
    required this.inCart,
    this.ratingCount,
    this.isFavourite,
    this.inProfile = false,
    this.discount,
  });
  factory ProductItem.fromJson(Map<String, dynamic> data) {
    return ProductItem(
      id: data["id"],
      brand: data["brand"],
      color: data["color"],
      name: data["name"],
      price: data["price"],
      size: data["size"],
      imageUri: data["image_uri"],
      inStock: data["in_stock"],
      inCart: data["in_cart"],
      ratingCount: data["rating_count"],
      isFavourite: data["is_favourite"],
      discount: data["discount_percentage"],
    );
  }
}

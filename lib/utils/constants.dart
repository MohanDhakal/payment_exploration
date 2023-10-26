import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/images.dart';

const List<String> categories = [
  "Tops",
  "Shirts & Blouses",
  "Cardigans & Sweaters",
  "Knitwear",
  "Blazers",
  "Outerwear",
  "Pants",
  "Jeans",
  "Shorts",
  "Skirts",
  "Dresses"
];
const List<String> subcategories = [
  "Crop tops",
  "Sleeveless",
  "Shirts",
  "T-shirts",
  "Sleeveless",
];
const List<String> filters = [
  "Popular",
  "Newest",
  "Customer review",
  "Price: highest to low",
  "Price: lowest to high",
];
final List<Color> colors = [
  Colors.orange,
  Colors.black,
  Colors.blue.shade900,
  Colors.red,
  Colors.red.shade100
];
const List<String> sizes = [
  "XS",
  "S",
  "M",
  "L",
  "XL",
];
const List<String> genderCategories = ["All", "Women", "Men", "Girls", "Boys"];
const List<String> brands = [
  "adidas Originals",
  "adidas",
  "Boutique Moschino",
  "Diesel",
  "Naf Naf",
  "s.Oliver",
  "Champion",
  "Blend",
];
const List<String> dropdowns = ['Size 1', 'Option 2', 'Option 3', 'Option 4'];
const List<String> colorOptions = ['Black', 'Red', 'Orange', 'Blue'];
const List<int> ratingsCount = [12, 2, 4, 5];
const List<Map<String, dynamic>> favouriteProducts = [
  {
    "id": 1,
    "brand": "LIME",
    "name": "Shirt",
    "color": "Blue",
    "price": 32.0,
    "size": 'M',
    "rating_count": 5,
    "is_favourite": true,
    "image_uri": AppImages.fav3,
    "in_stock": true,
    "in_cart": true,
  },
  {
    "id": 2,
    "brand": "Mango",
    "name": "Longsleeve Violeta",
    "color": "Orange",
    "price": 16.0,
    "size": 'S',
    "rating_count": 5,
    "is_favourite": true,
    "discount_percentage": 2,
    "image_uri": AppImages.fav1,
    "in_stock": false,
    "in_cart": false,
  },
  {
    "id": 3,
    "brand": "Oliver",
    "name": "Shirt",
    "color": "Gray",
    "price": 52.0,
    "size": 'L',
    "rating_count": 3,
    "is_favourite": false,
    "discount_percentage": 5,
    "image_uri": AppImages.fav2,
    "in_stock": true,
    "in_cart": true,
  },
  {
    "id": 2,
    "brand": "&berries",
    "name": "T-Shirt",
    "color": "Orange",
    "price": 16.0,
    "size": 'S',
    "rating_count": 5,
    "is_favourite": true,
    "discount_percentage": 2,
    "image_uri": AppImages.fav3,
    "in_stock": false,
    "in_cart": false,
  },
  {
    "id": 2,
    "brand": "&berries",
    "name": "T-Shirt",
    "color": "Orange",
    "price": 16.0,
    "size": 'S',
    "rating_count": 5,
    "is_favourite": true,
    "discount_percentage": 2,
    "image_uri": AppImages.fav3,
    "in_stock": true,
    "in_cart": true,
  },
];

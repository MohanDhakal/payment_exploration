import 'package:payment_exploration/model/product.dart';
import 'package:payment_exploration/utils/constants.dart';

class HandleProduct {
  Future<List<ProductItem>> getProducts() async {
    List<ProductItem> items = [];
    for (var element in favouriteProducts) {
      print(element);
      items.add(ProductItem.fromJson(element));
    }
    return items;
  }
}

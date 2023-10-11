// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_exploration/custom_app_icons.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/views/widgets/item_single.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Women’s tops",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: subcategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    alignment: Alignment.center,
                    child: Text(
                      subcategories.elementAt(index),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Row(
                  children: [
                    Icon(
                      CustomApp.baseline_filter_list_24px,
                    ),
                    Text(
                      "Filters",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      CustomApp.baseline_swap_vert_24px,
                    ),
                    Text(
                      "Price Lowest to High",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Icon(
                  CustomApp.view,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.63,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: size.width * 0.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SingleProduct(
                      productName: "T-Shirt Spanish",
                      brand: "Mango",
                      amount: 9.0,
                      stock: 2,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

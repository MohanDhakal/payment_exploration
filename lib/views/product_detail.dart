// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/utils/images.dart';
import 'package:payment_exploration/views/widgets/item_single.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String selectedValue = dropdowns.elementAt(0);
  String selectedColor = colorOptions.elementAt(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              backgroundColor: AppColors.primaryColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  24.0,
                ),
                // Adjust the radius as needed
              ),
            ),
            child: const Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.share),
          )
        ],
        leading: GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(
          child: Text(
            "Short Dress",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.productDetailImage2,
                    height: 400,
                  ),
                  Image.asset(
                    AppImages.productDetailmage1,
                    height: 400,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: size.width * 0.35,
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    items: dropdowns.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      }
                    },
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                    ),
                    underline: Container(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: size.width * 0.35,
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: DropdownButton<String>(
                    value: selectedColor,
                    items: colorOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedColor = newValue;
                        });
                      }
                    },
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                    ),
                    underline: Container(),
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  margin: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.grey.shade300,
                        ),
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.grey.shade300,
                        ),
                        BoxShadow(
                          offset: Offset(1, 0),
                          color: Colors.grey.shade300,
                        ),
                        BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.grey.shade300,
                        )
                      ]),
                  child: const Icon(
                    Icons.favorite_border,
                    color: AppColors.gray,
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "H&M",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$19.99",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Short black dress",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go(RouteName.second +
                    RouteName.productDetail +
                    RouteName.productRating);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    Icon(
                      Icons.star_border_outlined,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Item Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16)
                ],
              ),
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Shipping info",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16)
                ],
              ),
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Support",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16)
                ],
              ),
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "You may also like these",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "12 items",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: size.height * 0.4,
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SingleProduct(
                      productName: 'Evening Dress',
                      brand: 'Dorothy Perkins',
                      amount: 12,
                      stock: 10,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/utils/images.dart';

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
      body: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
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
          )
        ],
      ),
    );
  }
}

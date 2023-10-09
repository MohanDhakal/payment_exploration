// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/images.dart';
import 'package:payment_exploration/views/widgets/sale_item.dart';

import 'widgets/item_single.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Material(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppImages.decorationImage2,
                  height: size.height * 0.3,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: size.height * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Street Clothes",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sale",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                            Text(
                              "Super summer sale!",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "view all",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SaleItem(
                          productName: "Evening Dress",
                          brand: "Dorothy Perkins",
                          amount: 15,
                          stock: 10,
                          discount: 20,
                          localImage: AppImages.productImage1,
                        ),
                        SaleItem(
                          productName: "Sport Dress",
                          brand: "Sitlly",
                          amount: 15,
                          stock: 10,
                          discount: 20,
                          localImage: AppImages.productImage2,
                        ),
                        SaleItem(
                          productName: "Evening Dress",
                          brand: "Dorothy Perkins",
                          amount: 15,
                          stock: 10,
                          discount: 20,
                          localImage: AppImages.productImage3,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                            Text(
                              "You’ve never seen it before!",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "view all",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SingleProduct(
                          productName: "Blouse",
                          brand: "OVS",
                          amount: 30,
                          stock: 1,
                        ),
                        SingleProduct(
                          productName: "T-Shirt Shailing",
                          brand: "Mango Boy",
                          amount: 10,
                          stock: 0,
                        ),
                        SingleProduct(
                          productName: "Evening Dress",
                          brand: "Dorothy Perkins",
                          amount: 12,
                          stock: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

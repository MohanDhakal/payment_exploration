// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/images.dart';
import 'widgets/item_single.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.7,
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.decorationImage1,
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.7,
                  ),
                  Positioned(
                    top: size.height * 0.2,
                    child: Container(
                      height: size.height * 0.5,
                      alignment: Alignment.center,
                      width: size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: size.width * 0.3,
                                child: Divider(
                                  thickness: 4,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: size.width * 0.05)
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Fashion \nSale",
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              width: size.width * 0.4,
                              height: 36,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      24.0,
                                    ), // Adjust the radius as needed
                                  ),
                                  elevation: 4,
                                ),
                                child: Center(
                                  child: const Text(
                                    'Check',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                children: [
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

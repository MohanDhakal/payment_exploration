// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:payment_exploration/model/product.dart';
import 'package:payment_exploration/utils/images.dart';
import '../utils/app_colors.dart';
import 'widgets/product_item_list.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
        title: const Text("Order Details"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            width: 160,
            height: 36,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: const Text(
              "Reorder",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 160,
            height: 36,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.primaryColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  color: Color(0xFFD32626),
                  blurRadius: 8,
                )
              ],
            ),
            child: const Text(
              "Leave feedback",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order №1947034",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "05-19-2019",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gray,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tracking Number ",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gray,
                    ),
                  ),
                  Text(
                    "IW3475453455",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Delivered",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2AA952),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "3 Items",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ProductItemList(
                item: ProductItem(
                  id: 1,
                  brand: "Mango",
                  color: "Red",
                  name: "T-Shirt Spanish",
                  price: 9.0,
                  size: "M",
                  imageUri: AppImages.getProductImages().elementAt(0),
                  inStock: true,
                  inCart: false,
                  ratingCount: 2,
                  inProfile: true,
                ),
              ),
              ProductItemList(
                item: ProductItem(
                  id: 2,
                  brand: "Mango",
                  color: "Red",
                  name: "Crop Top",
                  price: 11.2,
                  size: "S",
                  imageUri: AppImages.getProductImages().elementAt(1),
                  inStock: true,
                  inCart: false,
                  ratingCount: 3,
                  inProfile: true,
                ),
              ),
              // ProductItemList(
              //   item: ProductItem(
              //     id: 3,
              //     brand: "Mango",
              //     color: "Red",
              //     name: "Sandles",
              //     price: 9.0,
              //     size: "M",
              //     imageUri: AppImages.getProductImages().elementAt(2),
              //     inStock: true,
              //     inCart: false,
              //     ratingCount: 2,
              //     inProfile: true,
              //   ),
              // ),
              SizedBox(height: 16),
              Text(
                "Order Information",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping Address",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "3 Newbridge Court ,Chino Hills, CA 91709, United States",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment method:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    AppImages.mastercard,
                    height: 25,
                    width: 32,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "**** **** **** 3947",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery method:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "FedEx, 3 days, 15\$",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discount: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 56),
                  Expanded(
                    child: Text(
                      "10%, Personal promo code",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Amount: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      "133\$",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

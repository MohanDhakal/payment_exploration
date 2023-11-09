// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/images.dart';
import 'package:payment_exploration/utils/menu_action.dart';
import 'package:payment_exploration/views/widgets/promo_code.dart';

import '../routes/route_names.dart';

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  String promoCode = "Enter Your Promo Code";
  int count = 1;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then(
      (value) {},
    );
  }

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
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "My Bag",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.7,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return CartItemWidget(
                        itemName: "Item Number ${index++}",
                        itemCount: count,
                        onIncrement: () {
                          setState(() {
                            count++;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if (count > 1) {
                              count--;
                            }
                          });
                        },
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Container(
                  height: 36,
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 8,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        promoCode,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray,
                            fontSize: 12),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Total Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "124\$",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .go(RouteName.third + RouteName.checkout);
                    },
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
                      'CHECK OUT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.0),
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.gray,
                ),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: Container(
                  height: 36,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 8,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        promoCode,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              PromoCode(
                id: 1,
                validDays: 12,
                discountPercentage: 12.0,
                name: "Personal offer",
                description: "mypromocode2020",
                onSelected: (String code) {
                  setState(() {
                    promoCode = code;
                  });
                  GoRouter.of(context).pop();
                },
              ),
              SizedBox(height: 8.0),
              PromoCode(
                id: 2,
                validDays: 21,
                discountPercentage: 8.0,
                name: "Summer Sale",
                description: "summer2020",
                onSelected: (String code) {
                  setState(() {
                    promoCode = code;
                  });
                  GoRouter.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String itemName;
  final int itemCount;
  final Function() onIncrement;
  final Function() onDecrement;

  const CartItemWidget({
    super.key,
    required this.itemName,
    required this.itemCount,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppImages.fav1,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: size.width * 0.1),
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: Text('Add to Favourite'),
                            value: PopupMenuAction.favourite,
                          ),
                          PopupMenuItem(
                            child: Text('Delete from the list'),
                            value: PopupMenuAction.delete,
                          ),
                        ];
                      },
                      onSelected: (value) {
                        // Add your logic here
                        debugPrint('Selected: $value');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Color: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Black",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Size: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "L",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: onDecrement,
                        iconSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '$itemCount',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 36,
                      width: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: onIncrement,
                        iconSize: 16,
                      ),
                    ),
                    SizedBox(width: size.width * 0.1),
                    Text(
                      "43\$",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Implement this widget in your main application

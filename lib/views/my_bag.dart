// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/custom_app_icons.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/utils/images.dart';

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 16),
            Text(
              "Favorites",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
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
            SizedBox(height: 12),
          ]),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Sort by',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ...List.generate(filters.length, (index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(filters.elementAt(index)),
                        ),
                      );
                    }),
                  ],
                )
                // Text('This is the content of the bottom sheet.'),
                // SizedBox(height: 16.0),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: Text('Close'),
                // ),
              ],
            ),
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
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
                        onPressed: onIncrement,
                        iconSize: 24,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '$itemCount',
                      style: TextStyle(fontSize: 18),
                    ),
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
                        iconSize: 24,
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

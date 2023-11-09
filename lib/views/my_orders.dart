// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/order_status.dart';
import 'package:payment_exploration/views/order_details.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with TickerProviderStateMixin {
  List<OrderStatus> status = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    for (var element in OrderStatus.values) {
      status.add(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: status.length,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search),
            )
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Orders",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TabBar(
                    splashBorderRadius: BorderRadius.circular(8),
                    indicatorSize: TabBarIndicatorSize.label,
                    automaticIndicatorColorAdjustment: false,
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                    unselectedLabelColor: Colors.grey, //for unselected label//
                    labelPadding: const EdgeInsets.symmetric(vertical: 4),
                    indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 8,
                        color: Colors.black,
                      ),
                    ),
                    onTap: (value) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    },
                    tabs: [
                      ...List.generate(
                        status.length,
                        (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Tab(
                              child: Text(
                                status.elementAt(index).name,
                                style: TextStyle(
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height,
                    child: TabBarView(
                      children: [
                        OrderDetails(
                          status: OrderStatus.Delivered,
                        ),
                        OrderDetails(
                          status: OrderStatus.Processing,
                        ),
                        OrderDetails(
                          status: OrderStatus.Cancelled,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

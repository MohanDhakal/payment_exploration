// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/views/women_category.dart';

class DetailPage extends StatefulWidget {
  final Function() onSearch;
  const DetailPage({super.key, required this.onSearch});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // bool _searching = false;

  @override
  Widget build(BuildContext context) {
    const List<Tab> tabs = <Tab>[
      Tab(text: 'Women'),
      Tab(text: 'Men'),
      Tab(text: 'Kids'),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: tabs,
          ),
          actions: [
            GestureDetector(
              onTap: widget.onSearch,
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.search),
              ),
            )
          ],
          leading: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: const Center(
            child: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: const [
            // Content for Tab 1
            WomenCategory(),

            // Content for Tab 2
            Center(child: Text('Tab 2 Content')),

            // Content for Tab 3
            Center(child: Text('Tab 3 Content')),
          ],
        ),
      ),
    );
  }
}

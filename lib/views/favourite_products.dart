// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/custom_app_icons.dart';
import 'package:payment_exploration/model/product.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/utils/enums.dart';
import 'package:payment_exploration/viewmodel/product.dart';
import 'package:payment_exploration/views/widgets/product_item_list.dart';

import 'widgets/item_single.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<ProductItem> _list = [];
  String _selectedFiler = filters.elementAt(0);
  ViewType viewType = ViewType.LISTVIEW;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then(
      (value) {
        HandleProduct().getProducts().then((value) {
          setState(() {
            _list = value;
          });
        });
      },
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
              Text(
                "Favorites",
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .go(RouteName.fourth + RouteName.filterPage);
                    },
                    child: Row(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          CustomApp.baseline_swap_vert_24px,
                        ),
                        Text(
                          _selectedFiler,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (ViewType.GRIDVIEW == viewType) {
                        setState(() {
                          viewType = ViewType.LISTVIEW;
                        });
                      } else {
                        setState(() {
                          viewType = ViewType.GRIDVIEW;
                        });
                      }
                    },
                    child: Icon(
                      CustomApp.view,
                    ),
                  ),
                ],
              ),
              viewType == ViewType.LISTVIEW
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return ProductItemList(
                            item: _list.elementAt(index),
                          );
                        },
                      ),
                    )
                  : SizedBox(
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
                        },
                      ),
                    )
            ],
          ),
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
                        onTap: () {
                          setState(() {
                            _selectedFiler = filters.elementAt(index);
                          });
                          GoRouter.of(context).pop();
                        },
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

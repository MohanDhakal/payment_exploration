import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/views/widgets/category.dart';

import '../utils/app_colors.dart';

class CategorySearch extends StatelessWidget {
  const CategorySearch({super.key});

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
            child: Icon(Icons.search),
          )
        ],
        leading: GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        24.0,
                      ), // Adjust the radius as needed
                    ),
                    elevation: 2, // Elevation (shadow)
                  ),
                  child: const Text(
                    'View All Items',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Choose category",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategorySingle(
                      name: categories.elementAt(index),
                      onPressed: () {
                        //todo: implement category selection
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

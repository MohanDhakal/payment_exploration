// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/constants.dart';

class SelectBrand extends StatefulWidget {
  const SelectBrand({super.key});

  @override
  State<SelectBrand> createState() => _SelectBrandState();
}

class _SelectBrandState extends State<SelectBrand> {
  List<bool> checkedItems = List.generate(brands.length, (index) => false);

  void toggleCheckbox(int index) {
    setState(() {
      checkedItems[index] = !checkedItems[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(
          child: Text(
            "Filters",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColors.gray, fontSize: 16),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.0),
                prefixIcon: Icon(
                  Icons.search,
                  size: 16,
                  color: AppColors.gray,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(brands[index]),
                controlAffinity: ListTileControlAffinity.leading,
                value: checkedItems[index],
                onChanged: (value) {
                  toggleCheckbox(index);
                },
              );
            },
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.4,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      side: BorderSide(
                        color: AppColors.black,
                        width: 1.0,
                      ), // Adjust the radius as needed
                    ),
                    elevation: 2, // Elevation (shadow)
                  ),
                  child: const Text(
                    'Discard',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(width: 12),
              SizedBox(
                width: size.width * 0.4,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pop(checkedItems);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    elevation: 2, // Elevation (shadow)
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

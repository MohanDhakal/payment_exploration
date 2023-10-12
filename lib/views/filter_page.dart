// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/constants.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int _selectedGenderIndex = 0;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                'Price Range: \$${_currentRangeValues.start.round()} - \$${_currentRangeValues.end.round()}',
              ),
              RangeSlider(
                values: _currentRangeValues,
                max: 100,
                divisions: 5,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.gray,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
              const SizedBox(height: 8),
              Divider(thickness: 2),
              const SizedBox(height: 8),
              const Text(
                "Colors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(colors.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColorIndex = index;
                          });
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: _selectedColorIndex == index
                              ? BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red, // Color of the ring
                                    width: 2.0,
                                  ),
                                )
                              : null,
                          child: Container(
                            width: 42,
                            height: 42,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: colors.elementAt(index),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Divider(thickness: 2),
              const SizedBox(height: 8),
              const Text(
                "Sizes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(sizes.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSizeIndex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.gray, width: 0.4),
                            color: _selectedSizeIndex == index
                                ? AppColors.primaryColor
                                : null,
                          ),
                          child: Text(
                            sizes.elementAt(index),
                            style: TextStyle(
                              fontSize: 12,
                              color: _selectedSizeIndex == index
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Divider(thickness: 2),
              const SizedBox(height: 8),
              const Text(
                "Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: size.width,
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 8,
                  spacing: 16,
                  alignment: WrapAlignment.start,
                  children: [
                    ...List.generate(
                      genderCategories.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedGenderIndex = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: _selectedGenderIndex == index
                                    ? AppColors.primaryColor
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                                border: _selectedGenderIndex != index
                                    ? Border.all(color: AppColors.gray)
                                    : null),
                            child: Text(
                              genderCategories.elementAt(index),
                              style: TextStyle(
                                fontSize: 16,
                                color: _selectedGenderIndex == index
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Divider(thickness: 2),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final result = await GoRouter.of(context).push(
                      RouteName.fourth +
                          RouteName.filterPage +
                          RouteName.brandPage);
                  if (result != null) {
                    debugPrint(result.toString());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Brands",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "adidas Originals, Jack & Jones, s.Oliver",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 48),
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
                        GoRouter.of(context).pop();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import '../utils/images.dart';

class ThirdPage extends StatelessWidget {
  final Function() onDetail;
  const ThirdPage({super.key, required this.onDetail});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppImages.decorationImage3,
                    height: size.height * 0.5,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: size.height * 0.4,
                    left: size.width * 0.3,
                    child: const Text(
                      "New collection",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: onDetail,
                        child: Container(
                          color: AppColors.backgroundColor,
                          width: size.width * 0.5,
                          height: size.height * 0.25,
                          alignment: Alignment.center,
                          child: const Text(
                            "Summer Sale",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        AppImages.decorationImage4,
                        height: size.height * 0.25,
                        width: size.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.decorationImage5,
                    height: size.height * 0.5,
                    width: size.width * 0.5,
                    fit: BoxFit.cover,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

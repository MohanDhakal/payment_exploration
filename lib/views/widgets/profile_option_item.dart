// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/app_colors.dart';

class ProfileOptionItem extends StatelessWidget {
  final String title;
  final String detail;
  const ProfileOptionItem(
      {super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                detail,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.gray,
        )
      ],
    );
  }
}

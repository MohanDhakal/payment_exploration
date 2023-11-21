import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_colors.dart';
import '../settings.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          Container(
            width: 60,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.gray,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            "Password Change",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          const TextFormFieldWidget(
              labelText: 'Old Password', hintText: 'Enter your old password'),
          const SizedBox(height: 20.0),
          const TextFormFieldWidget(
              labelText: 'New Password', hintText: 'Enter your new password'),
          const SizedBox(height: 20.0),
          const TextFormFieldWidget(
              labelText: 'Repeat Password',
              hintText: 'Repeat your new password'),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
                  'SAVE PASSWORD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

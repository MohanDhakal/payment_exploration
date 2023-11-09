import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/images.dart';

import '../utils/app_colors.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.bags,
          ),
          const SizedBox(height: 24),
          const Text(
            "Success!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Your order will be delivered soon.Thank you for choosing our app!",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go(RouteName.first);
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
              'CONTINUE SHOPPING',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

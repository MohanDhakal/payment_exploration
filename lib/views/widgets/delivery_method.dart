import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/app_colors.dart';

class DeliveryMethod extends StatelessWidget {
  final String logo;
  final int fromday;
  final int today;
  const DeliveryMethod({
    super.key,
    required this.logo,
    required this.fromday,
    required this.today,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 72,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 24,
            color: Colors.black12,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logo,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            "$fromday to $today days",
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.gray,
            ),
          )
        ],
      ),
    );
  }
}

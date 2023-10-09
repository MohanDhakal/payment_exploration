import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/icons.dart';
import '../../utils/images.dart';

class SingleProduct extends StatelessWidget {
  final String productName, brand;
  final double amount;
  final int stock;
  const SingleProduct({
    super.key,
    required this.productName,
    required this.brand,
    required this.amount,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.4,
      margin: const EdgeInsets.all(8.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AppImages.productImage1,
                  width: size.width * 0.4,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                width: 40,
                height: 24,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 8, left: 8),
                child: const Text(
                  "New",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Positioned(
                top: 194,
                left: size.width * 0.26,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 8, left: 8),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(5, (index) {
                return Image.asset(
                  AppIcons.starInactive,
                  height: 16,
                  width: 16,
                  color: AppColors.gray,
                );
              }),
              Text(
                "($stock)",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          Text(
            brand,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            productName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$amount",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

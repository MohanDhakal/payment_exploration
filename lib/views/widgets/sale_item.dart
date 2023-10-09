import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import '../../utils/icons.dart';

class SaleItem extends StatelessWidget {
  final String productName, brand;
  final double amount;
  final int stock;
  final double discount;
  final String localImage;
  const SaleItem({
    super.key,
    required this.productName,
    required this.brand,
    required this.amount,
    required this.stock,
    required this.discount,
    required this.localImage,
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
                  localImage,
                  width: size.width * 0.4,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor,
                ),
                width: 50,
                height: 24,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 8, left: 8),
                child: Text(
                  "-$discount%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
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
                      ]),
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
                  color: Colors.amber,
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
          Row(
            children: [
              Text(
                "$amount\$ ",
                style: const TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                "${amount - (amount * discount * 0.01)}\$",
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

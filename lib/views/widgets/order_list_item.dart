import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/order_status.dart';

import '../../routes/route_names.dart';

class OrderListItem extends StatelessWidget {
  final OrderStatus status;
  const OrderListItem({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .go(RouteName.fifth + RouteName.myOrders + RouteName.orderDetails);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 24,
              color: Colors.black12,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order №1947034",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "05-19-2019",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  "Tracking Number ",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                  ),
                ),
                Text(
                  "IW3475453455",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.gray,
                      ),
                    ),
                    Text(
                      "3",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Total Amount",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.gray,
                      ),
                    ),
                    Text(
                      "112\$",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  status.name,
                  style: TextStyle(
                    fontSize: 14,
                    color: status == OrderStatus.Delivered
                        ? const Color(0xFF2AA952)
                        : (status == OrderStatus.Processing)
                            ? Colors.amber[400]
                            : AppColors.primaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

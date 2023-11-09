import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/utils/images.dart';
import 'package:payment_exploration/views/order_placed.dart';
import 'package:payment_exploration/views/widgets/delivery_method.dart';
import 'package:payment_exploration/views/widgets/shipping_address.dart';
import '../routes/route_names.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int defaultIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(
            child: Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: SizedBox(
          width: size.width,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(RouteName.orderPlaced);
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
              'SUBMIT ORDER',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Shipping Address",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ShippingAddress(
              onChanged: () {
                GoRouter.of(context).go(
                    RouteName.third + RouteName.checkout + RouteName.address);
              },
              personName: shippingAddresses.elementAt(defaultIndex)["name"],
              addressDetail:
                  shippingAddresses.elementAt(defaultIndex)["address_detail"],
              selection: false,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.65,
                  child: const Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go(RouteName.third +
                        RouteName.checkout +
                        RouteName.payment);
                  },
                  child: const Text(
                    "Change",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  width: 64,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                        blurRadius: 24,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppImages.mastercard,
                    height: 25,
                    width: 32,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  "**** **** **** 3947",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Text(
              "Delivery Method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DeliveryMethod(logo: AppImages.fedex, fromday: 2, today: 3),
                DeliveryMethod(logo: AppImages.dhl, fromday: 1, today: 2),
                DeliveryMethod(logo: AppImages.usps, fromday: 2, today: 3),
              ],
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order: ",
                  style: TextStyle(
                    color: AppColors.gray,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "112\$",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery: ",
                  style: TextStyle(
                    color: AppColors.gray,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "15\$",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Summary: ",
                  style: TextStyle(
                    color: AppColors.gray,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "127\$",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

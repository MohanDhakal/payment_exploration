import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/constants.dart';
import 'package:payment_exploration/views/widgets/shipping_address.dart';

import '../routes/route_names.dart';

class ChangeAddress extends StatelessWidget {
  const ChangeAddress({super.key});
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(
            child: Text(
          "Shipping Addresses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop(1);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          GoRouter.of(context).go(
            RouteName.third +
                RouteName.checkout +
                RouteName.address +
                RouteName.edit,
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          width: 36,
          height: 36,
          alignment: Alignment.center,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ShippingAddress(
                personName: shippingAddresses.elementAt(0)["name"],
                addressDetail: shippingAddresses.elementAt(0)["address_detail"],
                onChanged: () {},
                selection: true,
                onEdit: () {
                  GoRouter.of(context).go(
                    RouteName.third +
                        RouteName.checkout +
                        RouteName.address +
                        RouteName.edit,
                  );
                },
              ),
              const SizedBox(height: 16),
              ShippingAddress(
                personName: shippingAddresses.elementAt(1)["name"],
                addressDetail: shippingAddresses.elementAt(1)["address_detail"],
                onChanged: () {},
                selection: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

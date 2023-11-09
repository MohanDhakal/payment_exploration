// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/images.dart';
import 'package:payment_exploration/views/add_payment_method.dart';
import 'package:payment_exploration/views/widgets/payment_card_design.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(
            child: Text(
          "Payment Methods",
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
          showBottomSheet(
              context: context,
              builder: (context) {
                return AddPaymentMethod();
              });
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
      body: Column(
        children: [
          PaymentCard(
            active: true,
            logo: AppImages.mastercard,
          ),
          PaymentCard(
            active: false,
            logo: AppImages.dhl,
          ),
        ],
      ),
    );
  }
}

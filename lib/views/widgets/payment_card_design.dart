import 'package:flutter/material.dart';
import '../../utils/images.dart';

class PaymentCard extends StatefulWidget {
  final bool active;
  final String logo;

  const PaymentCard({super.key, required this.active, required this.logo});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xFF222222),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 24,
                        color: Colors.black12,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          AppImages
                              .chip, // Add your own path for the Mastercard logo image
                          height: 40,
                          width: 40,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '**** **** **** 1234', // Add your own card number
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Card Holder Name',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'John Doe', // Add your own card holder name
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiry Date',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '5/23', // Add your own card holder name
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            widget
                                .logo, // Add your own path for the Mastercard logo image
                            height: 40,
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            !widget.active
                ? Positioned(
                    top: 0,
                    left: 3,
                    child: Container(
                      height: 200,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      margin: const EdgeInsets.all(16.0),
                    ),
                  )
                : const SizedBox()
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value ?? false;
                  });
                }),
            const Text("Use as the Shipping address")
          ],
        ),
      ],
    );
  }
}

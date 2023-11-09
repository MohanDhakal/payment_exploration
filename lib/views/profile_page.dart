import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/images.dart';
import 'package:payment_exploration/views/widgets/profile_option_item.dart';

import '../routes/route_names.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Bag",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(AppImages.profileImage),
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Matilda Brown',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'matildabrown@gmail.com',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .go(RouteName.fifth + RouteName.orderDetail);
              },
              child: const ProfileOptionItem(
                title: 'My Orders',
                detail: '3 addresses',
              ),
            ),
            const SizedBox(height: 8),
            const ProfileOptionItem(
              title: 'Shipping addresses',
              detail: 'Already Have 12 Orders',
            ),
            const SizedBox(height: 8),
            const ProfileOptionItem(
              title: 'Payment methods',
              detail: 'Visa  **34',
            ),
            const SizedBox(height: 8),
            const ProfileOptionItem(
              title: 'Promocodes',
              detail: 'You have special promocodes',
            ),
            const SizedBox(height: 8),
            const ProfileOptionItem(
              title: 'My reviews',
              detail: 'Reviews for 4 items',
            ),
            const SizedBox(height: 8),
            const ProfileOptionItem(
              title: 'Settings',
              detail: 'Notifications, password',
            ),
          ],
        ),
      ),
    );
  }
}

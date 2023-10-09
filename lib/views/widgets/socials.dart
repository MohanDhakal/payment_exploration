import 'package:flutter/material.dart';

import '../../utils/icons.dart';

class SocialAccount extends StatelessWidget {
  const SocialAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            "Or Sign up with  social account",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 64,
              width: 92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: Colors.white),
              child: Image.asset(
                AppIcons.facebook,
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              alignment: Alignment.center,
              height: 64,
              width: 92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: Colors.white),
              child: Image.asset(
                AppIcons.google,
                height: 24,
                width: 24,
              ),
            )
          ],
        )
      ],
    );
  }
}

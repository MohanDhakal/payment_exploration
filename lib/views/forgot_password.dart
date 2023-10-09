import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  String emailError = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "Forgot password? ",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: size.height * 0.05),
            const Text(
              "Please, enter your email address. You will receive a link to create a new password via email.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              height: 64,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the radius as needed
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1, 0),
                    color: AppColors.gray,
                    spreadRadius: 2,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding: const EdgeInsets.only(left: 4.0),
                  border: InputBorder.none,
                  errorText: emailError,
                  labelStyle: TextStyle(color: AppColors.gray.withOpacity(0.6)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      24.0,
                    ), // Adjust the radius as needed
                  ),
                  elevation: 4, // Elevation (shadow)
                ),
                child: const Text(
                  'SEND EMAIL',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

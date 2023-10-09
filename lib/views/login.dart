// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:payment_exploration/dependencies/camera_dependencies.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/validators.dart';
import 'package:payment_exploration/views/widgets/socials.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void validateForm() {
    bool validated = _formKey.currentState?.validate() ?? false;
    if (validated) {
      Provider.of<CameraDependencies>(context).controller?.dispose();
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName
            .home, // Replace '/newScreen' with the name of the route you want to navigate to.
        (Route<dynamic> route) =>
            false, // This condition ensures that all previous routes are removed.
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: 72),
                Container(
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed

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
                    validator: validateEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      contentPadding: const EdgeInsets.only(left: 4.0),
                      border: InputBorder.none,
                      labelStyle:
                          TextStyle(color: AppColors.gray.withOpacity(0.6)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed
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
                    controller: passwordController,
                    obscureText: true,
                    validator: validatePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: const EdgeInsets.only(left: 4.0),
                      border: InputBorder.none,
                      labelStyle:
                          TextStyle(color: AppColors.gray.withOpacity(0.6)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.forgotPassword);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Forgot your password?  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Transform.rotate(
                        angle:
                            90 * 3.14159265359 / 180, // 90 degrees in radians
                        child: const Icon(Icons.straight),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: validateForm,
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
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.15),
                const SocialAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

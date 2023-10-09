import 'package:flutter/material.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/images.dart';
import '../utils/app_colors.dart';

class VisualSearchPage extends StatefulWidget {
  const VisualSearchPage({super.key});

  @override
  State<VisualSearchPage> createState() => _VisualSearchPageState();
}

class _VisualSearchPageState extends State<VisualSearchPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Visual Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), // Specify the color and opacity
              BlendMode.srcATop, // Specify the blend mode
            ),
            image: const AssetImage(
              AppImages.decorationImage,
            ), // Replace with your image path
            fit: BoxFit.cover, // Adjust the BoxFit as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Search for an outfit by taking a photo or uploading an image",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.clickImage,
                    );
                  },
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
                    'Take a Photo',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          24.0,
                        ), // Adjust the radius as needed
                        side: const BorderSide(
                          width: 2.0,
                          color: Colors.white,
                        )),

                    elevation: 4, // Elevation (shadow)
                  ),
                  child: const Text(
                    'Upload An Image',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

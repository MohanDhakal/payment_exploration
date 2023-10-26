import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/app_colors.dart';

class SubmitReviewSheet extends StatelessWidget {
  const SubmitReviewSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'What is you rate?',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            // Replace this with your own star rating widget
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 36,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Please share your opinion about the product",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            // Replace this with your own review text box widget
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray),
                  borderRadius: BorderRadius.circular(8)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Write your review here...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Flexible(
                  flex: 2,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Add your photos",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
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
                  'Submit Review',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

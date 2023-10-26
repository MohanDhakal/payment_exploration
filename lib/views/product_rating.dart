// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/viewmodel/rating.dart';
import 'package:payment_exploration/views/widgets/rating_box.dart';
import 'package:payment_exploration/views/widgets/rating_detail.dart';
import 'package:payment_exploration/views/widgets/submit_review.dart';
import '../model/rating.dart';

class ProductRating extends StatefulWidget {
  const ProductRating({super.key});
  @override
  State<ProductRating> createState() => _ProductRatingState();
}

class _ProductRatingState extends State<ProductRating> {
  List<Rating> ratings = [];
  bool withPhoto = false;

  @override
  void initState() {
    super.initState();
    HandleRating().getRatings().then((value) {
      setState(() {
        ratings = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: SizedBox(
          width: size.width * 0.4,
          child: ElevatedButton(
            onPressed: () {},
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
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    builder: (context) {
                      return SubmitReviewSheet();
                    });
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Write a Review',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rating&Reviews",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 48),
                RatingBox(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${ratings.length} reviews",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          withPhoto = !withPhoto;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            withPhoto
                                ? Icons.check_box
                                : Icons.check_box_outline_blank_rounded,
                            color: AppColors.gray,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "With photo",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: ratings.length,
                    padding: EdgeInsets.only(bottom: 96),
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RatingDetail(
                        rating: ratings.elementAt(index),
                        withPhoto: withPhoto,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

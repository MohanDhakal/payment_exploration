// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:payment_exploration/model/rating.dart';
import 'package:payment_exploration/utils/images.dart';

class RatingDetail extends StatefulWidget {
  final Rating rating;
  final bool withPhoto;
  const RatingDetail({
    super.key,
    required this.rating,
    required this.withPhoto,
  });

  @override
  State<RatingDetail> createState() => _RatingDetailState();
}

class _RatingDetailState extends State<RatingDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.rating.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            size: 16,
                          )
                        ],
                      ),
                      Text(
                        widget.rating.date,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.rating.message,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                  widget.withPhoto
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(widget.rating.images!.length,
                                  (index) {
                                return Image.asset(
                                  widget.rating.images!.elementAt(index),
                                  height: 104,
                                  width: 104,
                                );
                              })
                            ],
                          ),
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Helpful"),
                      SizedBox(width: 8),
                      Icon(
                        Icons.thumb_up_alt,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -12,
            left: -12,
            child: SizedBox(
              width: 40,
              height: 40,
              child: ClipOval(
                child: Image.asset(
                  AppImages.userRating,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

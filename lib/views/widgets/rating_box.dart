import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/constants.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: size.width * 0.2,
          child: const Column(
            children: [
              Text(
                "4.3",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.25,
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: size.width * 0.3,
          child: LayoutBuilder(builder: (context, constraints) {
            int maxNumber = ratingsCount
                .reduce((value, element) => value > element ? value : element);
            final double parentWidth = constraints.maxWidth;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  width: parentWidth * (ratingsCount[0] / maxNumber),
                  height: 12,
                ),
                const SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  width: parentWidth * (ratingsCount[1] / maxNumber),
                  height: 12,
                ),
                const SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  width: parentWidth * (ratingsCount[2] / maxNumber),
                  height: 12,
                ),
                const SizedBox(height: 4),
                Container(
                  width: parentWidth * (ratingsCount[3] / maxNumber),
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            );
          }),
        ),
        SizedBox(
          width: size.width * 0.1,
          child: Column(
            children: [
              const SizedBox(height: 4),
              Text(ratingsCount[0].toString()),
              Text(ratingsCount[1].toString()),
              Text(ratingsCount[2].toString()),
              Text(ratingsCount[3].toString()),
            ],
          ),
        ),
      ],
    );
  }
}

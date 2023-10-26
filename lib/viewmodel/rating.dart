import 'package:payment_exploration/utils/images.dart';

import '../model/rating.dart';

class HandleRating {
  Future<List<Rating>> getRatings() async {
    final result = List.generate(
      3,
      (index) => Rating(
        id: ++index,
        message:
            "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7\" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
        starCount: index.isEven ? 2 : 3,
        name: "Helene Moore",
        date: "2067-09-6",
        liked: false,
        images: AppImages.getRatingImages(),
      ),
    );
    return result;
  }
}

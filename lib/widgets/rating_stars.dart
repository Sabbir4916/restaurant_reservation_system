import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingStars extends StatelessWidget {
  final double rating;
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      onRatingUpdate: (rating) {},
      ignoreGestures: true,
    );
  }
}
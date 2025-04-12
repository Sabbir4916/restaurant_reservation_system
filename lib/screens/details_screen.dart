import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../widgets/rating_stars.dart';
import 'booking_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const DetailsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                restaurant.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                RatingStars(rating: restaurant.rating),
                const SizedBox(height: 16),
                Text(
                  restaurant.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookingScreen(restaurant: restaurant),
                      ),
                    );
                  },
                  child: const Text('Make Reservation', style: TextStyle(
                    color: Colors.black,
                    fontSize: 20),),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
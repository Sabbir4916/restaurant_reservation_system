import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class AppProvider with ChangeNotifier {
  final List<Restaurant> _restaurants = [];
  final List<Restaurant> _favorites = [];
  bool _isLoading = false;

  List<Restaurant> get restaurants => _restaurants;
  List<Restaurant> get favorites => _favorites;
  bool get isLoading => _isLoading;

  Future<void> loadRestaurants() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _restaurants.addAll([
      Restaurant(
        name: 'Sultans Dine',
        imageUrl:'https://images.pexels.com/photos/12737656/pexels-photo-12737656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        rating: 4.5,
        location: '1.2 miles away',
        description: 'Best Kacchi in town',
      ),
      Restaurant(
        name: 'Pizza Heaven',
        imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
        rating: 4,
        location: '0.5 miles away',
        description: 'All type of Chinese food are available here',
      ),
      Restaurant(
        name: 'Burger King',
        imageUrl:'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        rating: 3.8,
        location: '4 miles away',
        description: 'Welcome to the best burger place in town!',
      ),
       Restaurant(
        name: 'Seasonal Tastes',
        imageUrl:'https://images.unsplash.com/photo-1485962398705-ef6a13c41e8f?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        rating: 4.7,
        location: '2.2 miles away',
        description: 'A culionary journey through the seasons',
      ),
       Restaurant(
        name: 'Biriyani House',
        imageUrl:'https://images.pexels.com/photos/7353393/pexels-photo-7353393.jpeg?auto=compress&cs=tinysrgb&w=600',
        rating: 4.2,
        location: '1.2 miles away',
        description: 'Welcome to our place',
      ),
       Restaurant(
        name: 'Cake House',
        imageUrl:'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        rating: 3.8,
        location: '1.8 miles away',
        description: 'Best Food Here',
      ),
       Restaurant(
        name: 'House of Steaks',
        imageUrl:'https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        rating: 5,
        location: '0.5 miles away',
        description: 'Best Steak in town',
      ),
    ]);

    _isLoading = false;
    notifyListeners();
  }
}
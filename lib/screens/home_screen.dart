import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/restaurant_provider.dart';
import '/widgets/restaurant_card.dart';
import '../widgets/search_bar.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).loadRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final restaurants = provider.restaurants.where((r) => 
      r.name.toLowerCase().contains(_searchQuery.toLowerCase()) 
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Restaurants'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBarWidget(
              onChanged: (query) => setState(() => _searchQuery = query),
            ),
          ),
          if (provider.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (restaurants.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  'No restaurants found',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                itemCount: restaurants.length,
                itemBuilder: (_, index) => RestaurantCard(
                  restaurant: restaurants[index],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
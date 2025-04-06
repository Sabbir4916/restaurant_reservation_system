import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/restaurant_provider.dart';
import 'models/restaurant.dart';
import 'screens/booking_screen.dart';
import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        title: 'Restaurant Reservation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            elevation: 1,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          useMaterial3: true,
        ),
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => const WelcomeScreen(),
          '/register': (context) => const RegisterPage(),
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomeScreen(),
          '/details': (context) {
            final restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;
            return DetailsScreen(restaurant: restaurant);
          },
          '/booking': (context) {
            final restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;
            return BookingScreen(restaurant: restaurant);
          },
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}

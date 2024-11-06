import 'package:flutter/material.dart';
import 'package:route_flutter/screens/login_screen.dart';
import 'package:route_flutter/screens/profile_screen.dart';
import 'package:route_flutter/screens/setting_screen.dart';
import 'package:route_flutter/widgets/bottom_navigation_bar.dart';
import 'package:route_flutter/screens/product_card.dart';
import 'package:route_flutter/screens/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else if (index == 2) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side with person icon and text
                const Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                // Right side with bell and settings icons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        size: 26,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Add notification functionality here
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings_outlined,
                        size: 26,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            const Text(
              'Guest',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 36),

            // # Grid View
            InkWell(
              onTap: () {
                // Add your navigation or functionality here
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Widget Grid View',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 26,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    artistName: 'Artist ${index + 1}',
                    song: 'Song ${index + 1}',
                    imageUrl: 'assets/logo.png',
                  );
                },
              ),
            ),

            // # List view
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                // Add your navigation or functionality here
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Widget List View',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 26,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView(
                children: const [
                  ProductCard(
                    productName: 'Headline',
                    price: 1000,
                    imageUrl: 'assets/logo.png',
                  ),
                  ProductCard(
                    productName: 'Headline',
                    price: 49.99,
                    imageUrl: 'assets/logo.png',
                  ),
                  ProductCard(
                    productName: 'Headline',
                    price: 19.99,
                    imageUrl: 'assets/logo.png',
                  ),
                  ProductCard(
                    productName: 'Headline',
                    price: 99.99,
                    imageUrl: 'assets/logo.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Fixed this line
      ),
    );
  }
}

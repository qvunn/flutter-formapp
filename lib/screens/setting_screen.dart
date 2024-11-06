import 'package:flutter/material.dart';
import 'package:route_flutter/widgets/bottom_navigation_bar.dart'; // Make sure this import path matches your project structure
import 'package:route_flutter/screens/profile_screen.dart';
import 'package:route_flutter/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  // Changed to StatefulWidget
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 0; // Added selected index state

  void _onItemTapped(int index) {
    // Added navigation handler
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Profile Section
            const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Alfin Ahsanul',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Universitas Teknologi Yogyakarta',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Settings Menu Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildMenuButton(
                    context,
                    'Kelola Akun',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DetailScreen(title: 'Kelola Akun'),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  _buildMenuButton(
                    context,
                    'Notifikasi',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DetailScreen(title: 'Notifikasi'),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  _buildMenuButton(
                    context,
                    'Privacy Policy',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DetailScreen(title: 'Privacy Policy'),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  _buildMenuButton(
                    context,
                    'Terms of Services',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DetailScreen(title: 'Terms of Services'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(
              Icons.arrow_forward_outlined,
              size: 20,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

// Detail Screen in the same file
class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text(
          '$title Screen',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

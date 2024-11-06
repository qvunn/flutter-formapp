import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                // Changed from Image.network to Image.asset
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Quisque nec sem non dui vestibulum finibus.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // const Text(
                  //   'Today ~ 23 min',
                  //   style:
                  //       TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side with person icon and text
                      const Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Today ~ 23 min',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      // Right side with bell and settings icons
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_right,
                              size: 26,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Add notification functionality here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

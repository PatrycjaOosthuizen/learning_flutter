import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        SizedBox(
          width: double.infinity,
          height: 500,
          child: Image.asset(
            'assets/images/hero_nails.jpg', // ‼️add image later
            fit: BoxFit.cover,
          ),
        ),

        // Overlay content
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.4), // Dark overlay for contrast
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Zadbaj o swoje paznokcie',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Action for call
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brown,
                        ),
                        child: const Text('Zadzwoń'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Scroll to services section
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                        ),
                        child: const Text('Nasze Usługi'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

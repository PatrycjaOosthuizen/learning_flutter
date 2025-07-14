import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or AppColors.background if preferred
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              children: const [
                Navbar(),
                HeroSection(),
                // Add more sections later (e.g., ServicesPreview, Testimonials, Footer)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

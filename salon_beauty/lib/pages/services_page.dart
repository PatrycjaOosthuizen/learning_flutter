import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../theme/app_colors.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const Navbar(),
          Expanded(
            child: Center(
              child: Text(
                'Nasze Usługi',
                style: TextStyle(fontSize: 32, color: AppColors.brown),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

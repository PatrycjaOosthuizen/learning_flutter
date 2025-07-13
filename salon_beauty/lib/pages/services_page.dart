// lib/pages/services.dart

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/navbar.dart';
import '../widgets/service_card.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Manicure Klasyczny',
        'description': 'Profesjonalna pielęgnacja paznokci i skórek.',
        'icon': Icons.spa,
      },
      {
        'title': 'Manicure Hybrydowy',
        'description': 'Trwały kolor i blask nawet do 3 tygodni.',
        'icon': Icons.color_lens,
      },
      {
        'title': 'Pedicure',
        'description': 'Kompleksowa pielęgnacja stóp i paznokci.',
        'icon': Icons.self_improvement,
      },
      {
        'title': 'Stylizacja Paznokci',
        'description': 'Zdobienia, żele, tipsy i artystyczna stylizacja.',
        'icon': Icons.brush,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            const SizedBox(height: 20),
            Text(
              'Nasze Usługi',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.brown,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Poznaj nasze profesjonalne zabiegi pielęgnacyjne',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 800 ? 2 : 1;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    children: services.map((service) {
                      return ServiceCard(
                        title: service['title'] as String,
                        description: service['description'] as String,
                        icon: service['icon'] as IconData,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

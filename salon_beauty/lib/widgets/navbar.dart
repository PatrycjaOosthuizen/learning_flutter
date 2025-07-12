import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          color: AppColors.beige,
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _brand(),
              const SizedBox(height: 10),
              Wrap(
                spacing: 12,
                children: _navItems(context),
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _brand(),
              Row(
                children: _navItems(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _brand() {
    return Text(
      'Salon Paznokci',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.brown,
      ),
    );
  }

  List<Widget> _navItems(BuildContext context) {
    final items = {
      'Strona Główna': '/',
      'Usługi': '/services',
      'Galeria': '/gallery',
      'O nas': '/about',
      'Kontakt': '/contact',
    };

    return items.entries.map((entry) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(entry.value);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            entry.key,
            style: const TextStyle(fontSize: 16, color: AppColors.textColor),
          ),
        ),
      );
    }).toList();
  }}

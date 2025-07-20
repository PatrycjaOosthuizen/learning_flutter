import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return Container(
            color: AppColors.beige,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar (brand + hamburger or nav items)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _brand(),
                    if (!isMobile)
                      Row(children: _navItems(context))
                    else
                      IconButton(
                        icon: Icon(
                          _menuOpen ? Icons.close : Icons.menu,
                          color: AppColors.brown,
                        ),
                        onPressed: () {
                          setState(() {
                            _menuOpen = !_menuOpen;
                          });
                        },
                      ),
                  ],
                ),

                // Mobile nav items
                if (isMobile && _menuOpen)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _navItems(context),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _brand() {
    return Text(
      'Salon Beauty',
      style: const TextStyle(
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
      'O Nas': '/about',
      'Kontakt': '/contact',
    };

    return items.entries.map((entry) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(entry.value);
          setState(() {
            _menuOpen = false; // close menu after navigation
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Text(
            entry.key,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textColor,
            ),
          ),
        ),
      );
    }).toList();
  }
}
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nasze Usługi',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
              ),
              const SizedBox(height: 24),
              isMobile ? _buildColumnLayout() : _buildGridLayout(),
            ],
          ),
        ),
      ),
    );
  }

  /// For small screens (mobile)
  Widget _buildColumnLayout() {
    return Column(
      children: _serviceItems.map((item) => _ServiceCard(item: item)).toList(),
    );
  }

  /// For larger screens (desktop/tablet)
  Widget _buildGridLayout() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: _serviceItems.map((item) => _ServiceCard(item: item, isWide: true)).toList(),
    );
  }
}

// Sample service data
final List<_ServiceItem> _serviceItems = [
  _ServiceItem(
    title: 'Manicure Hybrydowy',
    description: 'Trwały i estetyczny manicure na każdą okazję.',
  ),
  _ServiceItem(
    title: 'Pedicure Klasyczny',
    description: 'Relaks i pielęgnacja dla Twoich stóp.',
  ),
  _ServiceItem(
    title: 'Stylizacja Paznokci',
    description: 'Unikalne wzory i kolory dopasowane do Ciebie.',
  ),
];

class _ServiceItem {
  final String title;
  final String description;

  _ServiceItem({required this.title, required this.description});
}

class _ServiceCard extends StatelessWidget {
  final _ServiceItem item;
  final bool isWide;

  const _ServiceCard({required this.item, this.isWide = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isWide ? 300 : double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightBeige,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.brown,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

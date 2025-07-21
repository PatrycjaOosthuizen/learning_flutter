import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Navbar(),
              const SizedBox(height: 32),

              // Hero Section with Founder
              _buildHeroSection(),
              const SizedBox(height: 60),

              // Experience & Philosophy Row
              _buildExperiencePhilosophySection(),
              const SizedBox(height: 60),

              // Why Choose Us Section
              _buildWhyChooseUsSection(),
              const SizedBox(height: 60),

              // Footer
              const BeautyStudioFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 800;
          final isMobile = constraints.maxWidth < 600;

          if (isDesktop) {
            return Row(
              children: [
                // Left side - Image
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/agnieszka.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                // Right side - Content
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Agnieszka',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppColors.brown,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Założycielka i Główna Stylistka',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Salon Paznokci to moje miejsce pasji i piękna. Nazywam się Agnieszka i od lat pomagam klientkom czuć się wyjątkowo dzięki profesjonalnej pielęgnacji paznokci.',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'W naszym salonie łączymy styl, jakość i wyjątkową atmosferę. Oferujemy szeroki zakres usług stylizacji paznokci, dbając o komfort i satysfakcję każdej klientki.',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Quick stats

                    ],
                  ),
                ),
              ],
            );
          } else {
            // Mobile layout
            return Column(
              children: [
                Container(
                  width: isMobile ? 200 : 300,
                  height: isMobile ? 200 : 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/agnieszka.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Agnieszka',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Założycielka i Główna Stylistka',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'Salon Paznokci to moje miejsce pasji i piękna. Nazywam się Agnieszka i od lat pomagam klientkom czuć się wyjątkowo dzięki profesjonalnej pielęgnacji paznokci. '
                      'W Salon Beauty łączę styl, jakość i wyjątkową atmosferę. Oferuję szeroki zakres usług stylizacji paznokci, dbając o komfort i satysfakcję każdej klientki.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildExperiencePhilosophySection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 800;

          if (isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Experience Cards
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doświadczenie',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.brown,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildExperienceCard(
                        '8+ lat doświadczenia',
                        'Profesjonalna stylizacja paznokci od 2016 roku',
                        Icons.star,
                      ),
                      const SizedBox(height: 16),
                      _buildExperienceCard(
                        'Certyfikowane kursy',
                        'Ukończone kursy z manicure hybrydowego, żelowego i nail art',
                        Icons.school,
                      ),
                      const SizedBox(height: 16),
                      _buildExperienceCard(
                        '1000+ zadowolonych klientek',
                        'Stale poszerzająca się baza stałych klientek',
                        Icons.favorite,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                // Philosophy
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: AppColors.brown.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Moja Filozofia',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.brown,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          '"Każda klientka zasługuje na wyjątkowe traktowanie. Moim celem jest nie tylko piękna stylizacja paznokci, ale także stworzenie atmosfery relaksu i komfortu. Używam wyłącznie najwyższej jakości produktów i dbam o każdy szczegół."',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textColor,
                            fontStyle: FontStyle.italic,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Mobile layout - stack vertically
            return Column(
              children: [
                // Experience section
                Column(
                  children: [
                    Text(
                      'Doświadczenie',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brown,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildExperienceCard(
                      '8+ lat doświadczenia',
                      'Profesjonalna stylizacja paznokci od 2016 roku',
                      Icons.star,
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      'Certyfikowane kursy',
                      'Ukończone kursy z manicure hybrydowego, żelowego i nail art',
                      Icons.school,
                    ),
                    const SizedBox(height: 16),
                    _buildExperienceCard(
                      '1000+ zadowolonych klientek',
                      'Stale poszerzająca się baza stałych klientek',
                      Icons.favorite,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Philosophy
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.brown.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Moja Filozofia',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.brown,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '"Każda klientka zasługuje na wyjątkowe traktowanie. Moim celem jest nie tylko piękna stylizacja paznokci, ale także stworzenie atmosfery relaksu i komfortu. Używam wyłącznie najwyższej jakości produktów i dbam o każdy szczegół."',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor,
                          fontStyle: FontStyle.italic,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildWhyChooseUsSection() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'Dlaczego wybrać mój salon?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.brown,
            ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;

              if (isDesktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _buildFeatureItem(
                            'Indywidualne podejście',
                            'Każda stylizacja jest dostosowana do Twoich potrzeb i stylu życia',
                            Icons.person_outline,
                          ),
                          const SizedBox(height: 24),
                          _buildFeatureItem(
                            'Najwyższa jakość',
                            'Używam wyłącznie profesjonalnych produktów renomowanych marek',
                            Icons.diamond_outlined,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: Column(
                        children: [
                          _buildFeatureItem(
                            'Przyjazna atmosfera',
                            'Salon to miejsce relaksu, gdzie możesz się zrelaksować i odpocząć',
                            Icons.spa_outlined,
                          ),
                          const SizedBox(height: 24),
                          _buildFeatureItem(
                            'Elastyczne terminy',
                            'Dostosowuję godziny pracy do Twoich potrzeb',
                            Icons.schedule_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildFeatureItem(
                      'Indywidualne podejście',
                      'Każda stylizacja jest dostosowana do Twoich potrzeb i stylu życia',
                      Icons.person_outline,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureItem(
                      'Najwyższa jakość',
                      'Używam wyłącznie profesjonalnych produktów renomowanych marek',
                      Icons.diamond_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureItem(
                      'Przyjazna atmosfera',
                      'Salon to miejsce relaksu, gdzie możesz się zrelaksować i odpocząć',
                      Icons.spa_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureItem(
                      'Elastyczne terminy',
                      'Dostosowuję godziny pracy do Twoich potrzeb',
                      Icons.schedule_outlined,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }


  Widget _buildExperienceCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.brown.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.brown,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.brown.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.brown,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
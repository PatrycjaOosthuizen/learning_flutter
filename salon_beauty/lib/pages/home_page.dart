import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // Better scroll feel
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Navbar(),
              const HeroSection(),
              SizedBox(height: isMobile ? 30 : 60),
              const WhyChooseUsSection(),
              SizedBox(height: isMobile ? 40 : 80),
              const FeaturedServicesSection(),
              SizedBox(height: isMobile ? 40 : 80),
              const TestimonialsSection(),
              SizedBox(height: isMobile ? 40 : 80),
              const CallToActionSection(),
              SizedBox(height: isMobile ? 20 : 40),
            ],
          ),
        ),
      ),
    );
  }
}

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Dlaczego Warto Nas Wybrać?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B7355),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Poczuj różnicę dzięki naszym usługom premium i dbałości o każdy detal',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 768;

              if (isMobile) {
                return Column(
                  children: [
                    _buildFeatureCard(
                        Icons.emoji_events,
                        'Doświadczone Stylistki',
                        'Certyfikowane profesjonalistki z pasją do\nstylizacji paznokci'
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                        Icons.star,
                        'Produkty Premium',
                        'Tylko najwyższej jakości lakiery i preparaty\ndla trwałych efektów'
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureCard(
                        Icons.favorite,
                        'Relaksująca Atmosfera',
                        'Wyjątkowe wnętrze zaprojektowane dla\nTwojego komfortu i relaksu'
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Expanded(child: _buildFeatureCard(
                        Icons.emoji_events,
                        'Doświadczone Stylistki',
                        'Certyfikowane profesjonalistki z pasją do\nstylizacji paznokci'
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildFeatureCard(
                        Icons.star,
                        'Produkty Premium',
                        'Tylko najwyższej jakości lakiery i preparaty\ndla trwałych efektów'
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildFeatureCard(
                        Icons.favorite,
                        'Relaksująca Atmosfera',
                        'Wyjątkowe wnętrze zaprojektowane dla\nTwojego komfortu i relaksu'
                    )),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFF8B7355),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FeaturedServicesSection extends StatelessWidget {
  const FeaturedServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          Text(
            'Polecane Usługi',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B7355),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Nasze najpopularniejsze zabiegi, wykonywane z precyzją i pasją',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 768;

              if (isMobile) {
                return Column(
                  children: [
                    _buildServiceCard(
                        'assets/images/manicure.jpg',
                        'Manicure Hybrydowy',
                        '90 zł',
                        '60 minut',
                        ['Długotrwały efekt', 'Odporny na odpryski', 'Piękny połysk']
                    ),
                    const SizedBox(height: 24),
                    _buildServiceCard(
                        'assets/images/nail_extension.jpg',
                        'Przedłużanie Paznokci Żelem',
                        '150 zł',
                        '120 minut',
                        ['Dowolny kształt i długość', 'Naturalny wygląd', 'Wysoka trwałość']
                    ),
                    const SizedBox(height: 24),
                    _buildServiceCard(
                        'assets/images/pedicure.jpg',
                        'Pedicure Spa',
                        '120 zł',
                        '75 minut',
                        ['Relaksująca kąpiel', 'Peeling i masaż', 'Głębokie nawilżenie']
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Expanded(child: _buildServiceCard(
                        'assets/images/manicure.jpg',
                        'Manicure Hybrydowy',
                        '90 zł',
                        '60 minut',
                        ['Długotrwały efekt', 'Odporny na odpryski', 'Piękny połysk']
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildServiceCard(
                        'assets/images/nail_extension.jpg',
                        'Przedłużanie Paznokci Żelem',
                        '150 zł',
                        '120 minut',
                        ['Dowolny kształt i długość', 'Naturalny wygląd', 'Wysoka trwałość']
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildServiceCard(
                        'assets/images/pedicure.jpg',
                        'Pedicure Spa',
                        '120 zł',
                        '75 minut',
                        ['Relaksująca kąpiel', 'Peeling i masaż', 'Głębokie nawilżenie']
                    )),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String imagePath, String title, String price, String duration, List<String> features) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      price,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B7355),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Color(0xFF666666)),
                    const SizedBox(width: 4),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Icon(Icons.check, size: 16, color: Color(0xFF8B7355)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Opinie Naszych Klientek',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B7355),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Prawdziwe doświadczenia naszych wspaniałych klientek',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 768;

              if (isMobile) {
                return Column(
                  children: [
                    _buildTestimonialCard(
                        '"Absolutnie uwielbiam to miejsce! Dbałość o szczegóły jest niesamowita."',
                        'Anna Nowak',
                        'assets/images/anna.jpg'
                    ),
                    const SizedBox(height: 24),
                    _buildTestimonialCard(
                        '"Najlepszy salon w mieście. Stylizacje są zawsze perfekcyjne!"',
                        'Katarzyna Kowalska',
                        'assets/images/katarzyna.jpg'
                    ),
                    const SizedBox(height: 24),
                    _buildTestimonialCard(
                        '"Atmosfera spa jest nie do podrobienia. Tak relaksująco i pięknie."',
                        'Jessica Wiśniewska',
                        'assets/images/jessica.jpg'
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Expanded(child: _buildTestimonialCard(
                        '"Absolutnie uwielbiam to miejsce! Dbałość o szczegóły jest niesamowita."',
                        'Anna Nowak',
                        'assets/images/anna.jpg'
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildTestimonialCard(
                        '"Najlepszy salon w mieście. Stylizacje są zawsze perfekcyjne!"',
                        'Katarzyna Kowalska',
                        'assets/images/katarzyna.jpg'
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildTestimonialCard(
                        '"Atmosfera spa jest nie do podrobienia. Tak relaksująco i pięknie."',
                        'Jessica Wiśniewska',
                        'assets/images/jessica.jpg'
                    )),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String testimonial, String name, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            )),
          ),
          const SizedBox(height: 16),
          Text(
            testimonial,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF8B7355),
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CallToActionSection extends StatelessWidget {
  const CallToActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF8B7355), Color(0xFFA68B5B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Gotowa na odrobinę luksusu?',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Zadzwoń do nas już dziś i umów wizytę telefonicznie',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withValues(alpha: 0.9),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              // Add phone call functionality
            },
            icon: Icon(Icons.phone, color: Color(0xFF8B7355)),
            label: Text(
              'Zadzwoń: 507 987 789',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B7355),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
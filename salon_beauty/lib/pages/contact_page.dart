import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _openMapsApp() async {
    // Coordinates for Ul. Poniatowskiego 23, 24-150 Nałęczów
    const double lat = 51.2847;
    const double lng = 22.2115;

    // Try Google Maps app first, then fallback to browser
    final googleMapsAppUrl = 'google.navigation:q=$lat,$lng';
    final googleMapsWebUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    try {
      final Uri appUri = Uri.parse(googleMapsAppUrl);
      if (await canLaunchUrl(appUri)) {
        await launchUrl(appUri);
      } else {
        await _launchUrl(googleMapsWebUrl);
      }
    } catch (e) {
      // Final fallback to web
      await _launchUrl(googleMapsWebUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.beige,
        title: const Text(
          'Kontakt',
          style: TextStyle(
            color: AppColors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.brown),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(),
            // Main Content Section with max width constraint
            _buildMainContentWithConstraints(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContentWithConstraints() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200), // Max width for large screens
        child: Column(
          children: [
            // Main Content Section
            _buildContactSection(),
            // Social Media - only show on mobile/tablet (desktop has it integrated)
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 1024) {
                  return _buildSocialSection();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.beige, AppColors.background],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const Text(
                'Odwiedź Nas',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Zapraszamy do naszego salonu piękności w Nałęczowie.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor.withValues(alpha: 0.8),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 1024;

          if (isDesktop) {
            // Desktop: 2 columns layout
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column: Map and Social Media
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildSalonPhotoAndMap(),
                      const SizedBox(height: 20),
                      _buildSocialSection(),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                // Right column: Opening Hours, then Contact Info
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildOpeningHours(),
                      const SizedBox(height: 20),
                      _buildContactInfo(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // Mobile/Tablet: Original stacked layout
            return Column(
              children: [
                _buildSalonPhotoAndMap(),
                const SizedBox(height: 40),
                _buildContactAndHoursSection(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildContactAndHoursSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // More responsive breakpoints
        final isDesktop = constraints.maxWidth > 1024;
        final isTablet = constraints.maxWidth > 768 && constraints.maxWidth <= 1024;

        if (isDesktop) {
          // Desktop: side by side with more spacing
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: _buildOpeningHours()),
              const SizedBox(width: 60),
              Expanded(flex: 1, child: _buildContactInfo()),
            ],
          );
        } else if (isTablet) {
          // Tablet: side by side with less spacing
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildOpeningHours()),
              const SizedBox(width: 30),
              Expanded(child: _buildContactInfo()),
            ],
          );
        } else {
          // Mobile: stacked
          return Column(
            children: [
              _buildOpeningHours(),
              const SizedBox(height: 20),
              _buildContactInfo(),
            ],
          );
        }
      },
    );
  }

  Widget _buildSalonPhotoAndMap() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.brown.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: AppColors.brown,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Znajdź nas tutaj',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Clickable map image with consistent aspect ratio
          GestureDetector(
            onTap: _openMapsApp,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: 16 / 9, // Maintain consistent aspect ratio
                  child: Image.asset(
                    'assets/images/map.png',
                    width: double.infinity,
                    fit: BoxFit.cover, // This will show the full map maintaining aspect ratio
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'ul. Poniatowskiego 23, 24-150 Nałęczów',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 30),

          // Responsive button
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth > 600 ? 300 : double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _openMapsApp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brown,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Otwórz w mapach',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      children: [
        _buildContactCard(
          icon: Icons.phone,
          title: 'Telefon',
          subtitle: '507 987 789',
          buttonText: 'Zadzwoń teraz',
          onPressed: () => _launchUrl('tel:507987789'),
        ),
        const SizedBox(height: 20),
        _buildContactCard(
          icon: Icons.email,
          title: 'Email',
          subtitle: 'kontakt@beautystudio.pl',
          buttonText: 'Wyślij email',
          onPressed: () => _launchUrl('mailto:kontakt@beautystudio.pl'),
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.brown,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brown,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.brown,
              padding: EdgeInsets.zero,
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpeningHours() {
    final hours = [
      {'day': 'Poniedziałek', 'time': '9:00 - 20:00'},
      {'day': 'Wtorek', 'time': '9:00 - 20:00'},
      {'day': 'Środa', 'time': '9:00 - 20:00'},
      {'day': 'Czwartek', 'time': '9:00 - 20:00'},
      {'day': 'Piątek', 'time': '9:00 - 20:00'},
      {'day': 'Sobota', 'time': '9:00 - 20:00'},
      {'day': 'Niedziela', 'time': 'Zamknięte'},
    ];

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.brown.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.access_time,
                  color: AppColors.brown,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Godziny Otwarcia',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: hours.map((hour) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hour['day']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    hour['time']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: hour['time'] == 'Zamknięte'
                          ? const Color(0xFFD32F2F)
                          : AppColors.brown,
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check if we're in desktop mode within the contact section
        final isInDesktopLayout = constraints.maxWidth > 500; // Adjusted threshold for column context

        return Container(
          margin: isInDesktopLayout ? EdgeInsets.zero : const EdgeInsets.all(20),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Obserwuj nas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Obserwuj nas na Instagramie, aby być na bieżąco z najnowszymi inspiracjami w stylizacji paznokci i aktualnościami z salonu!',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () => _launchUrl('https://instagram.com/beautystudio'),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.brown,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.brown.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Obserwuj na Instagram',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
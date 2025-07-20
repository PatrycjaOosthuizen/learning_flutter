import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BeautyStudioFooter extends StatelessWidget {
  const BeautyStudioFooter({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri uri = Uri.parse('tel:$phoneNumber');
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch phone call');
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri uri = Uri.parse('mailto:$email');
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch email');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: const Color(0xFF1F2937), // gray-900
      padding: EdgeInsets.symmetric(
          vertical: 48,
          horizontal: isMobile ? 24 : 80
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isLargeScreen = constraints.maxWidth >= 1024;

                  return isLargeScreen
                      ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildBeautyStudioSection()),
                      Expanded(flex: 1, child: Center(child: _buildQuickLinksSection(context))),
                      Expanded(flex: 1, child: _buildContactSection()),
                    ],
                  )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBeautyStudioSection(),
                      const SizedBox(height: 32),
                      _buildQuickLinksSection(context),
                      const SizedBox(height: 32),
                      _buildContactSection(),
                    ],
                  );
                },
              ),
              const SizedBox(height: 48),
              Container(height: 1, color: const Color(0xFF374151)), // Divider
              const SizedBox(height: 32),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBeautyStudioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFFBBF24),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Color(0xFF1F2937), size: 20),
            ),
            const SizedBox(width: 8),
            const Text(
              'Beauty Studio',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Doświadcz profesjonalnej stylizacji paznokci i zabiegów kosmetycznych w luksusowym wydaniu. '
              'Nasi eksperci tworzą piękne, trwałe stylizacje w relaksującej, ekskluzywnej atmosferze.',
          style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => _launchUrl('https://instagram.com'),
          borderRadius: BorderRadius.circular(4),
          child: const Icon(Icons.camera_alt_outlined, color: Color(0xFF9CA3AF), size: 20),
        ),
      ],
    );
  }

  Widget _buildQuickLinksSection(BuildContext context) {
    final Map<String, String> navRoutes = {
      'Strona Główna': '/',
      'Usługi': '/services',
      'Galeria': '/gallery',
      'O Nas': '/about',
      'Kontakt': '/contact',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Szybkie Linki', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        ...navRoutes.entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, entry.value),
            child: Text(entry.key, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, height: 1.5)),
          ),
        )),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Kontakt', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => _launchPhone('507987789'),
          child: Row(
            children: const [
              Icon(Icons.phone_outlined, color: Color(0xFFFBBF24), size: 20),
              SizedBox(width: 12),
              Text('507 987 789', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => _launchEmail('kontakt@beautystudio.pl'),
          child: Row(
            children: const [
              Icon(Icons.email_outlined, color: Color(0xFFFBBF24), size: 20),
              SizedBox(width: 12),
              Text('kontakt@beautystudio.pl', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.location_on_outlined, color: Color(0xFFFBBF24), size: 20),
            SizedBox(width: 12),
            Expanded(
              child: Text('ul. Poniatowskiego 23, 24-150 Nałęczów',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, height: 1.4)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmall = constraints.maxWidth < 640;
        return isSmall
            ? Column(
          children: const [
            Text('© 2025 Beauty Studio. Wszelkie prawa zastrzeżone.',
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 12), textAlign: TextAlign.center),
            SizedBox(height: 8),
            Text('Strona stworzona przez Patrycja Oosthuizen',
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 11), textAlign: TextAlign.center),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('© 2025 Beauty Studio. Wszelkie prawa zastrzeżone.',
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
            Text('Strona stworzona przez Patrycja Oosthuizen',
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 11)),
          ],
        );
      },
    );
  }
}
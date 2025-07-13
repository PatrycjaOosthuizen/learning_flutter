import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/about_page.dart';
import 'pages/gallery_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon Beauty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/services': (context) => const ServicesPage(),
        '/about': (context) => const AboutPage(),
        '/gallery': (context) => const GalleryPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}

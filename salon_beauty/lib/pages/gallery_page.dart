import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/navbar.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int currentIndex = 0;

  // List of your 12 salon assets
  final List<String> galleryImages = const [
    'assets/images/gallery/salon1.jpg',
    'assets/images/gallery/salon2.jpg',
    'assets/images/gallery/salon3.jpg',
    'assets/images/gallery/salon4.jpg',
    'assets/images/gallery/salon5.jpg',
    'assets/images/gallery/salon6.jpg',
    'assets/images/gallery/salon7.jpg',
    'assets/images/gallery/salon8.jpg',
    'assets/images/gallery/salon9.jpg',
    'assets/images/gallery/salon10.jpg',
    'assets/images/gallery/salon11.jpg',
    'assets/images/gallery/salon12.jpg',
  ];

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % galleryImages.length;
    });
  }

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + galleryImages.length) % galleryImages.length;
    });
  }

  void _selectImage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Navbar(),
                const SizedBox(height: 20),
                Text(
                  'Galeria Zdjęć Salonu Beauty',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildGalleryLayout(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryLayout(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        if (isMobile) {
          return _buildMobileLayout(context);
        } else {
          return _buildDesktopLayout(context, constraints);
        }
      },
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // Main image with navigation
          _buildMainImageContainer(context, true),
          const SizedBox(height: 20),
          // Horizontal scrollable thumbnails
          _buildHorizontalThumbnails(),
          const SizedBox(height: 20),
          // Image counter
          _buildImageCounter(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: constraints.maxWidth > 1200 ? 1200 : constraints.maxWidth,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main image section (70% width)
            Expanded(
              flex: 7,
              child: _buildMainImageContainer(context, false),
            ),
            const SizedBox(width: 20),
            // Thumbnail section (30% width)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wybierz zdjęcie:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.brown,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildThumbnailGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainImageContainer(BuildContext context, bool isMobile) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withValues(alpha: 0.12),
    blurRadius: 25.0,
    offset: const Offset(0, 8),
    ),
    BoxShadow(
    color: Colors.black.withValues(alpha: 0.08),
    blurRadius: 10.0,
    offset: const Offset(0, 4),
    ),
    ],
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Container(
    color: Colors.grey[100], // Background color to avoid white frames
    child: Stack(
    children: [
    // Main image with proper sizing
    SizedBox(
    width: double.infinity,
    height: isMobile ? 300 : 500,
    child: Image.asset(
    galleryImages[currentIndex],
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
    return Container(
    color: Colors.grey[300],
    child: const Center(
    child: Icon(
    Icons.image_not_supported,
    size: 50,
    color: Colors.grey,
    ),
    ),
    );
    },
    ),
    ),
    // Navigation arrows with better positioning
    Positioned(
    left: 20,
    top: 0,
    bottom: 0,
    child: Center(
    child: _buildNavigationButton(
    Icons.chevron_left,
    _previousImage,
    ),
    ),
    ),
    Positioned(
    right: 20,
    top: 0,
    bottom: 0,
    child: Center(
    child: _buildNavigationButton(
    Icons.chevron_right,
    _nextImage,
    ),
    ),
    ),
    // Full screen button
    Positioned(
    top: 20,
    right: 20,
    child: _buildFullScreenButton(),
    ),
    // Image info overlay
    Positioned(
    bottom: 20,
    left: 20,
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
    color: Colors.black.withValues(alpha: 0.7),
    borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
    '${currentIndex + 1} / ${galleryImages.length}',
    style: const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    ),
    ),
    ),
    ),
    // Bottom navigation on mobile
    if (isMobile)
    Positioned(
    bottom: 20,
    right: 20,
    child: _buildBottomNavigation(),
    ),
    ],
    ),
    ),
    ),
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 24, color: AppColors.brown),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildFullScreenButton() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(Icons.fullscreen, size: 24, color: AppColors.brown),
        onPressed: () => _showFullScreenImage(context, galleryImages[currentIndex]),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.touch_app, size: 16, color: AppColors.brown),
          const SizedBox(width: 6),
          Text(
            'Dotknij',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.brown,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnailGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      itemCount: galleryImages.length,
      itemBuilder: (context, index) {
        return _buildThumbnail(index);
      },
    );
  }

  Widget _buildHorizontalThumbnails() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: galleryImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: _buildThumbnail(index),
          );
        },
      ),
    );
  }

  Widget _buildThumbnail(int index) {
    bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => _selectImage(index),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? AppColors.brown : Colors.grey[300]!,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.brown.withValues(alpha: 0.3),
                blurRadius: 8.0,
                offset: const Offset(0, 4),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 6.0,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.grey[100],
            child: Image.asset(
              galleryImages[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCounter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'Zdjęcie ${currentIndex + 1} z ${galleryImages.length}',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.brown,
        ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
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
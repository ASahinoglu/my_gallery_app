import 'package:flutter/material.dart';
import 'gallery_screen.dart';
import 'favorites_screen.dart';
import 'about_screen.dart';
import '../theme/app_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final Set<String> _favoriteIds = {}; //  Favoriten

  void _toggleFavorite(String id) {
    setState(() {
      if (_favoriteIds.contains(id)) {
        _favoriteIds.remove(id);
      } else {
        _favoriteIds.add(id);
      }
    });
  }

  List<Widget> get _widgetOptions => [
    GalleryScreen(favoriteIds: _favoriteIds, onToggleFavorite: _toggleFavorite),
    FavoritesScreen(
      favoriteIds: _favoriteIds,
      onToggleFavorite: _toggleFavorite,
    ),
    const AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        backgroundColor: AppColors.primary,
        indicatorColor: Colors.grey,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        //labelPadding: EdgeInsets.all(4.0),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: AppColors.text),
        ),
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.photo_outlined, color: AppColors.text),
            selectedIcon: Icon(Icons.photo, color: AppColors.text),
            label: 'Bilder',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border_outlined, color: AppColors.text),
            selectedIcon: Icon(Icons.favorite, color: AppColors.text),
            label: 'Favoriten',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.text),
            selectedIcon: Icon(Icons.person, color: AppColors.text),
            label: 'Über mich',
          ),
        ],
      ),
    );
  }
}

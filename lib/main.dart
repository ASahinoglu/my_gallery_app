import 'package:flutter/material.dart';
import 'screens/gallery_screen.dart';
import 'screens/about_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gallery App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          //backgroundColor: Color.fromARGB(255, 110, 22, 16),
          backgroundColor: Color(0xFFB7414F),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

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

  final Set<String> _favoriteIds = {};

  void _toggleFavorite(String id) {
    setState(() {
      if (_favoriteIds.contains(id)) {
        _favoriteIds.remove(id);
      } else {
        _favoriteIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      // NavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        backgroundColor: const Color(0xFFB7414F),
        indicatorColor: const Color(0xFFF9D6D6),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white),
        ),

        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(
              Icons.photo_outlined,
              color: Colors.white,
            ), // Outline-Icon für nicht ausgewählt
            selectedIcon: Icon(
              Icons.photo,
              color: Colors.blue,
            ), // Ausgewählter Icon
            label: 'Bilder',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ), // Outline-Icon für nicht ausgewählt
            selectedIcon: Icon(
              Icons.favorite,
              color: Colors.blue,
            ), // Ausgewählter Icon
            label: 'Favoriten',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: Colors.white,
            ), // Outline-Icon für nicht ausgewählt
            selectedIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ), // Ausgewählter Icon
            label: 'Über mich',
          ),
        ],
      ),
    );
  }
}

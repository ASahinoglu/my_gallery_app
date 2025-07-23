import 'package:flutter/material.dart';
import 'screens/gallery_screen.dart';
import 'screens/about_screen.dart';

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
        // 'useMaterial3: true' ist für NavigationBar empfohlen
        useMaterial3: true,
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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

  static const List<Widget> _widgetOptions = <Widget>[
    GalleryScreen(),
    AboutScreen(),
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
      // NavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(
              Icons.photo_outlined,
            ), // Outline-Icon für nicht ausgewählt
            selectedIcon: Icon(Icons.photo), // Ausgewählter Icon
            label: 'Bilder',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
            ), // Outline-Icon für nicht ausgewählt
            selectedIcon: Icon(Icons.person), // Ausgewählter Icon
            label: 'Über mich',
          ),
        ],
      ),
    );
  }
}

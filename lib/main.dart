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
              color: Colors.black,
            ), // Ausgewählter Icon
            label: 'Bilder',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: Colors.white,
            ), // Outline-Icon für nicht ausgewählt
            selectedIcon: Icon(
              Icons.person,
              color: Colors.black,
            ), // Ausgewählter Icon
            label: 'Über mich',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../gallery_data.dart';
import '../models/gallery_item.dart';
import '../widgets/gallery_card.dart';
import '../widgets/custom_app_bar.dart';

enum SortOption { newest, oldest, titleAsc, titleDesc }

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<GalleryItem> _currentGalleryItems = [];

  @override
  void initState() {
    super.initState();
    _currentGalleryItems = List.from(galleryData);
  }

  void _sortGalleryItems(SortOption option) {
    setState(() {
      switch (option) {
        case SortOption.newest:
          _currentGalleryItems.sort(
            (a, b) => b.imageDate.compareTo(a.imageDate),
          );
          break;
        case SortOption.oldest:
          _currentGalleryItems.sort(
            (a, b) => a.imageDate.compareTo(b.imageDate),
          );
          break;
        case SortOption.titleAsc:
          _currentGalleryItems.sort(
            (a, b) => a.imageTitle.toLowerCase().compareTo(
              b.imageTitle.toLowerCase(),
            ),
          );
          break;
        case SortOption.titleDesc:
          _currentGalleryItems.sort(
            (a, b) => b.imageTitle.toLowerCase().compareTo(
              a.imageTitle.toLowerCase(),
            ),
          );
          break;
      }
    });
    Navigator.pop(context);

    String message;
    switch (option) {
      case SortOption.newest:
        message = 'Bilder nach Datum (neueste zuerst) sortiert!';
        break;
      case SortOption.oldest:
        message = 'Bilder nach Datum (älteste zuerst) sortiert!';
        break;
      case SortOption.titleAsc:
        message = 'Bilder nach Titel (A-Z) sortiert!';
        break;
      case SortOption.titleDesc:
        message = 'Bilder nach Titel (Z-A) sortiert!';
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Nach Datum (Neueste zuerst)'),
                onTap: () => _sortGalleryItems(SortOption.newest),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Nach Datum (Älteste zuerst)'),
                onTap: () => _sortGalleryItems(SortOption.oldest),
              ),
              ListTile(
                leading: const Icon(Icons.sort_by_alpha),
                title: const Text('Nach Titel (A-Z)'),
                onTap: () => _sortGalleryItems(SortOption.titleAsc),
              ),
              ListTile(
                leading: const Icon(Icons.sort_by_alpha),
                title: const Text('Nach Titel (Z-A)'),
                onTap: () => _sortGalleryItems(SortOption.titleDesc),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'MyGallery',
        actions: [
          IconButton(icon: const Icon(Icons.sort), onPressed: _showSortOptions),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.8,
          ),
          itemCount: _currentGalleryItems.length,
          itemBuilder: (context, index) {
            final item = _currentGalleryItems[index];
            return GalleryCard(item: item);
          },
        ),
      ),
    );
  }
}

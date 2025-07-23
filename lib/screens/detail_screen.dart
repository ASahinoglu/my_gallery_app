import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // für date formatting
import 'package:my_gallery_app/models/gallery_item.dart';

class DetailScreen extends StatelessWidget {
  final GalleryItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.id,
              child: Image.asset(
                item.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.imageTitle,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    DateFormat('dd.MM.yyyy').format(item.imageDate),
                    style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    item.imageDescription,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

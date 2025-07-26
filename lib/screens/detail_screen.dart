import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // für date formatting
import 'package:my_gallery_app/models/gallery_item.dart';
import '../theme/app_theme.dart';
import 'package:my_gallery_app/widgets/custom_app_bar.dart';

class DetailScreen extends StatelessWidget {
  final GalleryItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Bildschirmhöhe abrufen, um die Bildhöhe relativ zu setzen
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Details', showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: item.id,
                child: Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  height: screenHeight * 0.40,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.imageTitle, style: AppFonts.headline2),
                    const SizedBox(height: 8.0),
                    Text(
                      DateFormat('dd.MM.yyyy').format(item.imageDate),
                      style: AppFonts.body,
                    ),
                    const SizedBox(height: 16.0),
                    Text(item.imageDescription, style: AppFonts.caption),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

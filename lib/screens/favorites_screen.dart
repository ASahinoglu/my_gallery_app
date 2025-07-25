import 'package:flutter/material.dart';
import '../widgets/gallery_card.dart';
import '../widgets/custom_app_bar.dart';
import '../gallery_data.dart';

class FavoritesScreen extends StatelessWidget {
  final Set<String> favoriteIds;
  final void Function(String) onToggleFavorite;

  const FavoritesScreen({
    super.key,
    required this.favoriteIds,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteItems = galleryData
        .where((item) => favoriteIds.contains(item.id))
        .toList();

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Favoriten'),
      body: SafeArea(
        child: favoriteItems.isEmpty
            ? const Center(
                child: Text(
                  'Noch keine Favoriten.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  final item = favoriteItems[index];
                  return GalleryCard(
                    item: item,
                    isFavorite: true,
                    onFavoriteToggle: () => onToggleFavorite(item.id),
                  );
                },
              ),
      ),
    );
  }
}

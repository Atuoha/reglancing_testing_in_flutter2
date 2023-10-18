import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorites.dart';
import '../widgets/favorite_list_tile.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static String routeName = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<Favorites>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          favoriteProvider.items.isNotEmpty
              ? GestureDetector(
                  onTap: () => favoriteProvider.removeAllFromFav(),
                  child: const Icon(Icons.cancel),
                )
              : const SizedBox.shrink(),
          const SizedBox(width: 18)
        ],
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => value.items.isEmpty
            ? const Center(
                child: Text(
                  'No favorite item to display',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) =>
                    FavoriteItemTile(value.items[index]),
              ),
      ),
    );
  }
}

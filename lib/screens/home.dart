import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/favorites.dart';
import '../widgets/item_list_tile.dart';
import 'favorites.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isScrollingUp = false;

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {context.go('/${FavoritesPage.routeName}')},
        label: Visibility(
          visible: isScrollingUp,
          child: const Text('Favorites'),
        ),
        icon: const Icon(Icons.favorite),
      ),
      appBar: AppBar(
        title: const Text('Testing Sample'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              context.go('/${FavoritesPage.routeName}');
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.scrollDelta!.isNegative) {
              // scrolling up
              setState(() {
                isScrollingUp = true;
              });
            } else {
              // scrolling down
              setState(() {
                isScrollingUp = false;
              });
            }
          }

          return false;
        },
        child: ListView.builder(
          controller: scrollController,
          itemCount: 100,
          cacheExtent: 20.0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => ItemTile(index),
        ),
      ),
    );
  }
}

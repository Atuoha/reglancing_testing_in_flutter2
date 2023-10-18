import 'package:flutter/material.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Favorites extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get items => _favoriteItems;

  void removeAllFromFav() {
    _favoriteItems.clear();
    notifyListeners();
  }

  bool checkIsFav(int id) {
    return _favoriteItems.any((item) => item == id);
  }

  void toggleIsFav(int item) {
    if (_favoriteItems.contains(item)) {
      _favoriteItems.remove(item);
    } else {
      _favoriteItems.add(item);
    }
    notifyListeners();
  }

  // testing purposes -add
  void remove(int item) {
    if (_favoriteItems.contains(item)) {
      _favoriteItems.remove(item);
    }
    notifyListeners();
  }

  // testing purposes -remove
  void add(int item) {
    _favoriteItems.add(item);

    notifyListeners();
  }
}

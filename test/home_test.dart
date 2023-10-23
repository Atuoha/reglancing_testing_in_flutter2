import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reglancing_testing_in_flutter2/models/favorites.dart';
import 'package:reglancing_testing_in_flutter2/screens/favorites.dart';
import 'package:reglancing_testing_in_flutter2/screens/home.dart';
import 'package:flutter_test/flutter_test.dart';

late Favorites favoriteList;

Widget createsHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (_) => Favorites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group(
      'Testing Widgets in the App',
      () => {
            testWidgets(('Home Widgets'), (tester) async {
              await tester.pumpWidget(createsHomeScreen());
              expect(find.text('Item 0'), findsOneWidget);

              await tester.fling(
                find.byType(ListView),
                const Offset(0, -200),
                3000,
              );
              await tester.pumpAndSettle();
              expect(find.text('Item 0'), findsNothing);
            }),
            testWidgets('Test For ListView', (tester) async {
              await tester.pumpWidget(createsHomeScreen());
              expect(find.byType(ListView), findsOneWidget);
            }),
          });

  group('Testing Stuffs in the App', () {
    testWidgets('Testing for stuffs', (widgetTester) async {
      await widgetTester.pumpWidget(createsHomeScreen());

      expect(find.text('Item 2'), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);

      expect(find.byIcon(Icons.favorite_border), findsWidgets);
      await widgetTester.tap(find.byIcon(Icons.favorite_border).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Added to favorites.'), findsOneWidget);

      await widgetTester.tap(find.byIcon(Icons.favorite).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });

  Widget createFavoriteWidget = ChangeNotifierProvider<Favorites>(
    create: (context) {
      favoriteList = Favorites();
      return favoriteList;
    },
    child: const MaterialApp(
      home: FavoritesPage(),
    ),
  );

  void addToFavorites() {
    for (var i = 0; i < 10; i += 2) {
      favoriteList.add(i);
    }
  }

  group('Test elements in Favorite Page', () {
    testWidgets('Test Stuffs in Fav Page', (widgetTester) async {
      await widgetTester.pumpWidget(createFavoriteWidget);
      addToFavorites();
      await widgetTester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

      testWidgets('Testing removing button', (widgetTester) async {
        await widgetTester.pumpWidget(createFavoriteWidget);
        addToFavorites();

        await widgetTester.pumpAndSettle();
        var totalLength =
            widgetTester.widgetList(find.byIcon(Icons.close)).length;
        await widgetTester.tap(find.byIcon(Icons.close).first);
        await widgetTester.pumpAndSettle();
        expect(widgetTester.widgetList(find.byIcon(Icons.close)).length,
            lessThan(totalLength));

        expect(find.text('Removed from favorites.'), findsOneWidget);
      });
  });
}

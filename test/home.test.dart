import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reglancing_testing_in_flutter2/models/favorites.dart';
import 'package:reglancing_testing_in_flutter2/screens/home.dart';
import 'package:flutter_test/flutter_test.dart';

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
            })
          });
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reglancing_testing_in_flutter2/models/favorites.dart';
import 'package:reglancing_testing_in_flutter2/screens/home.dart';
import 'package:test/test.dart';

Widget createsHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (_) => Favorites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );



void main(){

  group('Testing Widgets in the App', () => {

  });
}
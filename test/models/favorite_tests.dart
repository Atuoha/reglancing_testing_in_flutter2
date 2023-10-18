import 'package:reglancing_testing_in_flutter2/models/favorites.dart';
import 'package:test/test.dart';

void main() {
  group('Test App Provider', () {
    var favorite = Favorites();

    test('A new item should be added', () async {
      var number = 65;
      favorite.add(number);

      expect(favorite.checkIsFav(number), true);
    });

    test('A new item should be removed', () async {
      var number = 5;
      favorite.add(number);
      favorite.remove(number);

      expect(favorite.checkIsFav(number), false);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:translation/infrastructure/utilities/get_random_id.dart';

void main() {
  group("Test Utilities", () {
    test("Random Doc Id", () {
      final first = getRandomId;
      final second = getRandomId;

      expect(first == second, false);
    });
  });
}

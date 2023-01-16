import 'package:flutter_test/flutter_test.dart';
import 'package:netflix_clone/app/app.locator.dart';

import '../../test/helpers/test_helpers.dart';

void main() {
  group('MyAccountViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}


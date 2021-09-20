import 'package:flutter_test/flutter_test.dart';
import 'package:findme/App.dart';

void main() {
  testWidgets('Initial test', (WidgetTester tester) async {
    await tester.pumpWidget(App());
  });
}

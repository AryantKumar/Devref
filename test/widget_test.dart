import 'package:flutter_test/flutter_test.dart';
import 'package:devref/main.dart';

void main() {
  testWidgets('DevRef app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DevRefApp());
    expect(find.text('DevRef'), findsOneWidget);
  });
}

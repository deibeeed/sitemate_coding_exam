import 'package:flutter_test/flutter_test.dart';
import 'package:sitemate_coding_exam/app/app.dart';
import 'package:sitemate_coding_exam/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}

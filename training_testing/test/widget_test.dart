import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_testing/body_content.dart';
import 'package:training_testing/boilerplate.dart';

void main() {
  testWidgets('pump change text button and change text',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Boilerplate(
      child: BodyContent(),
    ));

    expect(find.text('dungngminh'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'pump text'));
    await tester.pumpAndSettle();

    expect(find.text('lynnlynn'), findsOneWidget);
  });

  testWidgets('pump change color button and change color of container',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Boilerplate(
      child: BodyContent(),
    ));
    expect(
        (((tester.firstWidget(find.byType(AnimatedContainer))
                    as AnimatedContainer)
                .decoration) as BoxDecoration)
            .color,
        Colors.blue);
    await tester.tap(find.widgetWithText(ElevatedButton, 'pump color'));
    await tester.pumpAndSettle();

    expect(
        (((tester.firstWidget(find.byType(AnimatedContainer))
                    as AnimatedContainer)
                .decoration) as BoxDecoration)
            .color,
        Colors.red);
  });
}

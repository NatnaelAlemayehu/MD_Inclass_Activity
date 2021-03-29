import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loginscreen/pages/details.dart';

void main() {
  testWidgets("Button <return to login> is created",
      (WidgetTester tester) async {
    final widget = MaterialApp(
      home: DetailsPage(),
    );
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    expect(find.byKey(Key('Button')), findsOneWidget);
  });

  testWidgets("Title and message are present", (WidgetTester tester) async {
    final widget = MaterialApp(
      home: DetailsPage(),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.text('About the App'), findsOneWidget);
    expect(find.text('This App was developed for educational purposes'),
        findsOneWidget);
  });

  testWidgets("Button color <return to login> is blue",
      (WidgetTester tester) async {
    final widget = MaterialApp(
      home: DetailsPage(),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final buttonMaterial = find.descendant(
      of: find.byType(ElevatedButton),
      matching: find.byType(Material),
    );

    final materialButton = tester.widget<Material>(buttonMaterial);

    expect(materialButton.color, Colors.blue);
  });

  testWidgets("Button <return to login> presents sign in Icon",
      (WidgetTester tester) async {
    final widget = MaterialApp(
      home: DetailsPage(),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.byKey(Key('icon_login')), findsOneWidget);
  });
}

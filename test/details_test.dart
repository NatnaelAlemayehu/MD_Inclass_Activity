import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loginscreen/pages/details.dart';

void main() {
  testWidgets("Button to go back to sign in was created",
      (WidgetTester tester) async {
    final widget = MaterialApp(
      home: DetailsPage(),
    );
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    expect(find.byKey(Key('Button')), findsOneWidget);
  });

  testWidgets("Title and page messange is present",
      (WidgetTester tester) async {
    final widget = MaterialApp(
      home: DetailsPage(),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.text('About the App'), findsOneWidget);
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

  testWidgets("Icon for <return to login> was created",
      (WidgetTester tester) async {
    final widget = MaterialApp(
      home: DetailsPage(),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.byKey(Key('icon_login')), findsOneWidget);
  });
}

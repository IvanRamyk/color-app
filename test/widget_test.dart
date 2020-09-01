import 'package:colorapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Container changes color after tapping', (WidgetTester tester) async {
    await tester.pumpWidget(ColorApp());
    final animatedContainer = find.byType(AnimatedContainer);
    expect(animatedContainer, findsOneWidget);
    final containerBeforeTap = tester.firstWidget(animatedContainer) as AnimatedContainer;
    final colorBeforeTap = (containerBeforeTap.decoration as BoxDecoration).color;
    await tester.tap(animatedContainer);
    await tester.pump();
    final containerAfterTap = tester.firstWidget(animatedContainer) as AnimatedContainer;
    final colorAfterTap = (containerAfterTap.decoration as BoxDecoration).color;
    expect(colorBeforeTap, isNot(colorAfterTap));
  });

  testWidgets('Container changes color after long press', (WidgetTester tester) async {
    await tester.pumpWidget(ColorApp());
    final animatedContainer = find.byType(AnimatedContainer);
    expect(animatedContainer, findsOneWidget);
    final containerBeforeLongPress = tester.firstWidget(animatedContainer) as AnimatedContainer;
    final colorBeforeLongPress = (containerBeforeLongPress.decoration as BoxDecoration).color;
    await tester.longPress(animatedContainer);
    await tester.pump();
    final containerAfterLongPress = tester.firstWidget(animatedContainer) as AnimatedContainer;
    final colorAfterLongPress = (containerAfterLongPress.decoration as BoxDecoration).color;
    expect(colorBeforeLongPress, isNot(colorAfterLongPress));
  });

  testWidgets('Container does not change color after slides', (WidgetTester tester) async {
    await tester.pumpWidget(ColorApp());
    final animatedContainer = find.byType(AnimatedContainer);
    expect(animatedContainer, findsOneWidget);
    final containerBefore = tester.firstWidget(animatedContainer) as AnimatedContainer;
    final colorBefore = (containerBefore.decoration as BoxDecoration).color;
    await tester.drag(animatedContainer, Offset(500.0, 0.0));
    await tester.drag(animatedContainer, Offset(0.0, 500.0));
    await tester.pump();
    final containerAfter = tester.firstWidget(animatedContainer) as AnimatedContainer;
    final colorAfter = (containerAfter.decoration as BoxDecoration).color;
    expect(colorBefore, colorAfter);
  });
}

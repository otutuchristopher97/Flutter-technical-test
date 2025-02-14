import 'package:flutter/material.dart';
import 'package:flutter_tech_task/src/post/presentation/view/widget/post_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_tech_task/core/routing/router.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';

/// ✅ **Mock NavigatorObserver for Navigation Testing**
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  const testPost = Post(
    id: 1,
    userId: 1,
    title: "Test Title",
    body: "This is a test post body.",
  );

  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });

  testWidgets('should display post title and body', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PostWidget(post: testPost),
        ),
      ),
    );

    // Assert: Ensure the post title and body are displayed
    expect(find.text("Test Title"), findsOneWidget);
    expect(find.text("This is a test post body."), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('should render empty text when post is null', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PostWidget(post: null),
        ),
      ),
    );

    // Assert: Empty text should be displayed
    expect(find.text(""), findsNWidgets(2)); // Title and body should be empty
  });
}

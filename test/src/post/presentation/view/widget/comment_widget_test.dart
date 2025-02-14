import 'package:flutter/material.dart';
import 'package:flutter_tech_task/src/post/presentation/view/widget/comment_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tech_task/src/post/domain/entities/comment.dart';

void main() {
  const testComment = Comment(
    id: 1,
    postId: 1,
    name: "John Doe",
    email: "johndoe@example.com",
    body: "This is a test comment.",
  );

  testWidgets('should display comment name, email, and body', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CommentWidget(comment: testComment),
        ),
      ),
    );

    // Assert
    expect(find.text("John Doe"), findsOneWidget);
    expect(find.text("johndoe@example.com"), findsOneWidget);
    expect(find.text("This is a test comment."), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('should render empty text when comment is null', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CommentWidget(comment: null),
        ),
      ),
    );

    // Assert: Empty text should be displayed
    expect(find.text(""), findsNWidgets(3));
  });
}

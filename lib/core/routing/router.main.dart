part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.splashScreen:
      return _pageBuilder(
        (_) => const SplashScreen(),
        settings: settings,
      );
    case RouteConstants.postscreen:
      return _pageBuilder(
        (_) => const PostScreen(),
        settings: settings,
      );
    case RouteConstants.postdetailscreen:
      return _pageBuilder(
        (_) {
          final args = settings.arguments as Map<String, dynamic>?;
          final int? postId = args?['id'] as int?;
          return PostDetailScreen(postId: postId);
        },
        settings: settings,
      );
    case RouteConstants.commentscreen:
      return _pageBuilder(
        (_) {
          final args = settings.arguments as Map<String, dynamic>?;
          final int? postId = args?['id'] as int?;
          return CommentScreen(postId: postId);
        },
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}


class RouteConstants {
  const RouteConstants._();

  static const postscreen = "/postscreen";
  static const splashScreen = "/splashscreen";
  static const postdetailscreen = "/postdetailscreen";
  static const commentscreen = "/commentscreen";
}
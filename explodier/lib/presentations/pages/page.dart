part of 'router.dart';

abstract class MyPage {
  final String path;
  final String name;

  MyPage(
    this.path,
    this.name,
  );

  Page<void> pageBuilder(BuildContext context, GoRouterState state);
}

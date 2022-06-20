import 'package:explodier/presentations/pages/home/home_screen.dart';
import 'package:explodier/presentations/pages/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage implements MyPage {
  @override
  String get name => 'home';

  @override
  String get path => '/';

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      key: state.pageKey,
      child: const HomeScreen(),
    );
  }
}

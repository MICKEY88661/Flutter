import 'package:explodier/presentations/pages/router.dart';
import 'package:explodier/presentations/pages/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage implements MyPage {
  @override
  String get name => 'signup';

  @override
  String get path => '/signup';

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      key: state.pageKey,
      child: const SignupScreen(),
    );
  }
}

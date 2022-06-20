import 'package:explodier/presentations/pages/router.dart';
import 'package:explodier/presentations/pages/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SigninPage implements MyPage {
  @override
  String get name => 'signin';

  @override
  String get path => '/signin';

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      key: state.pageKey,
      child: const SigninScreen(),
    );
  }
}

import 'package:explodier/presentations/pages/home/home_page.dart';
import 'package:explodier/presentations/pages/signin/signin_page.dart';
import 'package:explodier/presentations/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

final goRouterProvider = Provider((ref) {
  final home = HomePage();
  final signin = SigninPage();
  final signup = SignupPage();

  return GoRouter(
    initialLocation: signup.path,
    routes: [
      GoRoute(
        path: signin.path,
        name: signin.name,
        pageBuilder: signin.pageBuilder,
      ),
      GoRoute(
        path: signup.path,
        name: signup.name,
        pageBuilder: signup.pageBuilder,
      ),
      GoRoute(
        path: home.path,
        name: home.name,
        pageBuilder: home.pageBuilder,
      ),
    ],
    // redirect: (state) {
    //   if(!isAuth) return signin
    //   if(isAuth) return home
    // },
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
  );
});

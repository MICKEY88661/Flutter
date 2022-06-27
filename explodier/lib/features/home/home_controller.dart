import 'package:explodier/features/home/home_state.dart';
import 'package:explodier/infrastructures/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeCtrlProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  final userRepo = ref.watch(userRepoProvider);
  return HomeController(
    HomeState(
      pageController: PageController(),
    ),
    userFacade: userRepo,
  );
});

class HomeController extends StateNotifier<HomeState> {
  final IUserRepostory userFacade;

  HomeController(
    HomeState state, {
    required this.userFacade,
  }) : super(state) {
    init();
  }

  void init() {
    state = state.copyWith(
      userName: userFacade.currentUser.name,
    );
  }

  void pageChanged(int index) {
    state.pageController.jumpToPage(index);
    state = state.copyWith(currentPageIndex: index);
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}

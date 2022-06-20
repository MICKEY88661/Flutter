import 'package:explodier/features/home/home_state.dart';
import 'package:explodier/infrastructures/repositories/balance_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeCtrlProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  return HomeController(
    const HomeState(
      balance: AsyncLoading(),
    ),
    balanceFacade: ref.watch(balanceRepoProvider),
  );
});

class HomeController extends StateNotifier<HomeState> {
  final IBalanceRepository balanceFacade;

  HomeController(
    HomeState state, {
    required this.balanceFacade,
  }) : super(state) {
    loadBalance();
  }
  Future<void> loadBalance() async {
    try {
      state = state.copyWith(balance: const AsyncLoading());
      final balance = await balanceFacade.getTokenBalance();
      state = state.copyWith(balance: AsyncData(balance));
    } catch (e) {
      state = state.copyWith(balance: AsyncError(e));
    }
  }
}

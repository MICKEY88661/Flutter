import 'package:explodier/features/balance/balance_state.dart';
import 'package:explodier/infrastructures/repositories/balance_repository.dart';
import 'package:explodier/infrastructures/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final balanceCtrlProvider =
    StateNotifierProvider.autoDispose<BalanceController, BalanceState>((ref) {
  final balanceRepo = ref.watch(balanceRepoProvider);
  final userRepo = ref.watch(userRepoProvider);

  return BalanceController(
    const BalanceState(
      balance: AsyncLoading(),
    ),
    balanceFacade: balanceRepo,
    userFacade: userRepo,
  );
});

class BalanceController extends StateNotifier<BalanceState> {
  final IBalanceRepository balanceFacade;
  final IUserRepostory userFacade;

  BalanceController(
    BalanceState state, {
    required this.balanceFacade,
    required this.userFacade,
  }) : super(state) {
    loadBalance();
  }

  Future<void> loadBalance() async {
    try {
      state = state.copyWith(balance: const AsyncLoading());
      final String contractAddress = userFacade.currentUser.walletAddress;
      final balance = await balanceFacade.getTokenBalances(
        contractAddress: contractAddress,
        chainId: 1,
      );
      // remove quote == 0
      balance.items?.removeWhere((element) => element?.quote == 0);
      // sort by qoute, bigger first
      balance.items?.sort((a, b) {
        if (a == null || b == null) {
          return 1;
        }
        return b.quote!.compareTo(a.quote!);
      });
      state = state.copyWith(balance: AsyncData(balance));
    } catch (e) {
      state = state.copyWith(balance: AsyncError(e));
    }
  }
}

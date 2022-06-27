import 'package:explodier/features/home/home_controller.dart';
import 'package:explodier/presentations/pages/balance/balance_screen.dart';
import 'package:explodier/presentations/pages/nft/nft_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userName = ref.watch(homeCtrlProvider).userName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $userName'),
      ),
      body: PageView(
        controller: ref.watch(homeCtrlProvider).pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          BalanceScreen(),
          NFTScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(homeCtrlProvider).currentPageIndex,
        onTap: (value) {
          ref.read(homeCtrlProvider.notifier).pageChanged(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Balances",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.interests),
            label: "NFTs",
          ),
        ],
      ),
    );
  }
}

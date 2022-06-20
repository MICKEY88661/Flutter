import 'package:explodier/features/home/home_controller.dart';
import 'package:explodier/infrastructures/repositories/balance_repository.dart';
import 'package:explodier/infrastructures/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userName = ref.watch(userRepoProvider).currentUser.name;
    final balance = ref.watch(homeCtrlProvider).balance;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $userName'),
      ),
      body: balance.when(data: (balance) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text('${balance.address}'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = balance.items?[index];
                  final logoUrl = item?.logoUrl;

                  return logoUrl == null
                      ? Text("name: ${item?.contractTickerSymbol}")
                      : Row(
                          children: [
                            Text("${item?.contractTickerSymbol} : "),
                            Text("${item?.balance}"),
                          ],
                        );
                },
                childCount: balance.items?.length,
              ),
            )
          ],
        );
      }, error: (_, __) {
        return const Text('error');
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeCtrlProvider.notifier).loadBalance();
        },
      ),
    );
  }
}

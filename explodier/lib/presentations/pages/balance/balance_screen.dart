import 'package:explodier/features/balance/balance_controller.dart';
import 'package:explodier/infrastructures/models/balance/balance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BalanceScreen extends ConsumerStatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends ConsumerState<BalanceScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final balance = ref.watch(balanceCtrlProvider).balance;

    return balance.when(
      data: (balance) {
        if (balance.items == null) {
          return const Text("no data");
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<BalanceItemModel?, String>(
                    dataSource: balance.items,
                    name: '${balance.address}',
                    dataLabelMapper: (item, index) => "$index",
                    xValueMapper: (item, _) => "${item?.contractTickerSymbol}",
                    yValueMapper: (item, _) => item?.quote,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "These are your currnecy (${balance.quoteCurrency})",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Flexible(
              child: ListView.builder(
                physics: RangeMaintainingScrollPhysics(),
                itemCount: balance.items!.length,
                itemBuilder: (context, index) {
                  final item = balance.items![index];
                  final symbol = item?.contractTickerSymbol;
                  final quote = item?.quote;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$index) $symbol : $quote"),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (_, __) {
        return const Text('error');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

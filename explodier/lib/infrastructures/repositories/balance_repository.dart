import 'package:dio/dio.dart';
import 'package:explodier/infrastructures/core/http_client.dart';
import 'package:explodier/infrastructures/models/balance/balance_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository.dart';

final balanceRepoProvider = Provider<IBalanceRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return BalanceRepository(dio);
});

abstract class IBalanceRepository {
  Future<BalanceModel> getTokenBalance();
}

class BalanceRepository extends Repository implements IBalanceRepository {
  final Dio dio;

  BalanceRepository(this.dio);

  // TODO inject chainID and address
  @override
  Future<BalanceModel> getTokenBalance() async {
    const int chainID = 1;
    const String address = "demo.eth";

    try {
      final response = await dio.get("$chainID/address/$address/balances_v2/");
      final balanceRes = BalanceResponseModel.fromJson(response.data);

      return balanceRes.data;
    } catch (e, s) {
      super.logger.severe(runtimeType, e, s);
      rethrow;
    }
  }
}

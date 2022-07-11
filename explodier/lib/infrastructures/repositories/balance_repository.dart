import 'package:dio/dio.dart';
import 'package:explodier/infrastructures/core/http_client.dart';
import 'package:explodier/infrastructures/models/balance/balance_model.dart';
import 'package:explodier/infrastructures/models/covalent/covalent_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository.dart';

final balanceRepoProvider = Provider<IBalanceRepository>((ref) {
  final dio = ref.watch(covalentDioProvider);
  return BalanceRepository(dio);
});

abstract class IBalanceRepository {
  Future<BalanceModel> getTokenBalances({
    required String contractAddress,
    required int chainId,
  });
}

class BalanceRepository extends Repository implements IBalanceRepository {
  final Dio dio;

  BalanceRepository(this.dio);

  // TODO inject chainID and address
  @override
  Future<BalanceModel> getTokenBalances({
    required String contractAddress,
    required int chainId,
  }) async {
    try {
      final path = "$chainId/address/$contractAddress/balances_v2/";
      final response = await dio.get(path);
      final balance = CovalentResponseModel<BalanceModel>.fromJson(
        response.data,
        BalanceModel.fromJson,
      ).data!;

      return balance;
    } catch (e, s) {
      super.logger.severe(runtimeType, e, s);
      rethrow;
    }
  }
}

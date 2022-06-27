import 'package:dio/dio.dart';
import 'package:explodier/infrastructures/core/http_client.dart';
import 'package:explodier/infrastructures/models/covalent/covalent_response_model.dart';
import 'package:explodier/infrastructures/models/nft/nft_metadata_model.dart';
import 'package:explodier/infrastructures/models/nft/nft_model.dart';
import 'package:explodier/infrastructures/repositories/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nftRepoProvider = Provider<INftRpository>((ref) {
  final dio = ref.watch(dioProvider);

  return NftRepository(dio);
});

abstract class INftRpository {
  Future<NftModel> getNftTokenIds({
    required String contractAddress,
    required int chainId,
  });
  Future<NftMetadataModel> getNftExternalMetadata({
    required String contractAddress,
    required String tokenId,
    required int chainId,
  });
}

class NftRepository extends Repository implements INftRpository {
  final Dio dio;

  NftRepository(this.dio);

  @override
  Future<NftMetadataModel> getNftExternalMetadata({
    required String contractAddress,
    required String tokenId,
    required int chainId,
  }) async {
    try {
      final path = "$chainId/tokens/$contractAddress/nft_metadata/$tokenId/";
      final response = await dio.get(path);
      final nftMetadata = CovalentResponseModel<NftMetadataModel>.fromJson(
        response.data,
        NftMetadataModel.fromJson,
      ).data!;
      return nftMetadata;
    } catch (e, s) {
      super.logger.severe(runtimeType, e, s);
      rethrow;
    }
  }

  @override
  Future<NftModel> getNftTokenIds({
    required String contractAddress,
    required int chainId,
  }) async {
    try {
      final path = "$chainId/tokens/$contractAddress/nft_token_ids/";
      final response = await dio.get(path);
      final nft = CovalentResponseModel<NftModel>.fromJson(
        response.data,
        NftModel.fromJson,
      ).data!;

      return nft;
    } catch (e, s) {
      super.logger.severe(runtimeType, e, s);
      rethrow;
    }
  }
}

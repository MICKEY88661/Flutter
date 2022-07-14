import 'package:dio/dio.dart';
import 'package:explodier/infrastructures/core/http_client.dart';
import 'package:explodier/infrastructures/models/covalent/covalent_response_model.dart';
import 'package:explodier/infrastructures/models/nft/nft_assets_model.dart';
import 'package:explodier/infrastructures/models/nft/nft_metadata_model.dart';
import 'package:explodier/infrastructures/repositories/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nftRepoProvider = Provider<INftRpository>((ref) {
  final covalentDio = ref.watch(covalentDioProvider);
  final blockdaemonDio = ref.watch(blockdaemonDioProvider);

  return NftRepository(
    covalentDio: covalentDio,
    blockdaemonDio: blockdaemonDio,
  );
});

abstract class INftRpository {
  Future<List<NftAssetModel>?> getUserNftAssets({
    required String walletAddress,
    required int chainId,
  });
  Future<NftMetadataModel> getNftExternalMetadata({
    required String contractAddress,
    required String tokenId,
    required int chainId,
  });
}

class NftRepository extends Repository implements INftRpository {
  final Dio covalentDio;
  final Dio blockdaemonDio;

  NftRepository({
    required this.covalentDio,
    required this.blockdaemonDio,
  });

  @override
  Future<List<NftAssetModel>?> getUserNftAssets({
    required String walletAddress,
    required int chainId,
  }) async {
    try {
      final path =
          "nft/ethereum/mainnet/assets?wallet_address=$walletAddress&page_size=1";
      final response = await blockdaemonDio.get(path);
      final nft = NftModel.fromJson(response.data);
      return nft.data;
    } catch (e, s) {
      super.logger.severe(runtimeType, e, s);
      rethrow;
    }
  }

  @override
  Future<NftMetadataModel> getNftExternalMetadata({
    required String contractAddress,
    required String tokenId,
    required int chainId,
  }) async {
    try {
      final path = "$chainId/tokens/$contractAddress/nft_metadata/$tokenId/";
      final response = await covalentDio.get(path);
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
}

import 'package:explodier/infrastructures/models/nft/v_nft_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:explodier/features/nft/nft_controller.dart';
import 'package:explodier/infrastructures/models/nft/nft_metadata_model.dart';

import 'nft_item.dart';

class NFTScreen extends ConsumerStatefulWidget {
  const NFTScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NFTScreen> createState() => _NFTScreenState();
}

class _NFTScreenState extends ConsumerState<NFTScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ref.watch(nftCtrlProvider).nftItems.when(
          data: (data) {
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("You have no assets"),
              );
            }

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return NftItem(
                  NftItemViewModel(
                    imageURL: data[index].imageURL,
                    name: data[index].name,
                    contractName: data[index].contractName,
                  ),
                );
              },
            );
          },
          error: (error, _) => Text(
            error.toString(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }

  @override
  bool get wantKeepAlive => true;
}

class Nft extends StatelessWidget {
  final NftExternalDataModel? externalData;
  const Nft(this.externalData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Image.network(
            "${externalData?.image}",
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              if (loadingProgress.expectedTotalBytes == null) {
                return const CircularProgressIndicator();
              }

              double value = loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!;

              return Text("$value");
            },
            errorBuilder: (_, __, s) {
              return const Text("no image");
            },
          ),
          Text("${externalData?.name}"),
          // Text("owner: ${externalData?.owner}"),
          // Text("${externalData?.description}"),
        ],
      ),
    );
  }
}

import 'package:explodier/infrastructures/models/nft/v_nft_item_model.dart';
import 'package:flutter/material.dart';

class NftItem extends StatelessWidget {
  final NftItemViewModel viewData;

  const NftItem(this.viewData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Visibility(
            visible: viewData.imageURL != null,
            child: Image.network(
              viewData.imageURL!,
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
              errorBuilder: (_, err, s) {
                return Text("😢${err.toString()}");
              },
            ),
          ),
          const Divider(),
          Text("${viewData.contractName}"),
          Text("${viewData.name}"),
        ],
      ),
    );
  }
}

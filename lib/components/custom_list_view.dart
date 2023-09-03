import 'package:flutter/material.dart';
import 'package:loadpage/interfaces/list_item.dart';
import 'custom_list_card_produto.dart';
import 'custom_list_card_usuario.dart';

class CustomListView extends StatelessWidget {
  final List<ListItem> data;

  const CustomListView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: data.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final item = data[index];

        if (item is UserItem) {
          return GestureDetector(
            onTap: () {
              print("Item ${item.id} (Usuário)");
            },
            child: CustomListCardUsuario(
              item: item,
            ),
          );
        } else if (item is ProductItem) {
          return GestureDetector(
            onTap: () {
              print("Item ${item.id} (Produto)");
            },
            child: CustomListCardProduto(
              item: item,
            ),
          );
        }

      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loadpage/interfaces/list_item.dart';

class CustomListCardProduto extends StatelessWidget {
  final ProductItem item;

  const CustomListCardProduto({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(item.image.details
              ? item.image.url
              : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlr4E2Wi_Gr-wISdg0Id5QkBczUHitf4vaaOSZ8yl4x7gwkWBkEZNMXPjf4ytH2NLOV9g&usqp=CAU'),
          height: 90,
          width: 90,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${item.nome}',
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              'Descrição: ${item.descricao}',
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              'Preço: ${item.preco.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

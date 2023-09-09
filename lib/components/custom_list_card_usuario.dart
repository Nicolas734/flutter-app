import 'package:flutter/material.dart';
import 'package:loadpage/interfaces/list_item.dart';

class CustomListCardUsuario extends StatelessWidget {
  final UserItem item;

  const CustomListCardUsuario({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(item.image.details ? item.image.url : 'https://cdn-icons-png.flaticon.com/512/666/666201.png', scale: 0.5),
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
              'CPF: ${item.cpf}',
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              'Email: ${item.email}',
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

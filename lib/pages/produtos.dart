import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loadpage/components/custom_app_bar.dart';
import 'package:loadpage/components/custom_list_view.dart';
import 'package:loadpage/interfaces/list_item.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  FormsState createState() => FormsState();
}

List<ProductItem> data = [];

class FormsState extends State<Produtos> {
  @override
  void initState() {
    super.initState();
    fetchData(); // Chame a função fetchData no momento apropriado, como o initState.
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://demo1810860.mockable.io/products'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        data.clear();
        for (int i = 0; i < jsonResponse.length; i++) {
          ProductItem item = ProductItem(
            id: jsonResponse[i]['id'],
            nome: jsonResponse[i]['nome'],
            descricao: jsonResponse[i]['descricao'],
            preco: jsonResponse[i]['preco'],
            qtd: jsonResponse[i]['qtd'],
            image: CustomImageInfo(
              details: jsonResponse[i]['image']['details'],
              url: jsonResponse[i]['image']['url'],
            ),
          );
          data.add(item);
        }
      });
    } else {
      print("Request Fail: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Produtos'),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50.0),
            const Text('Produtos cadastrados',
                style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 50.0),
            Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: CustomListView(data: data),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loadpage/components/custom_app_bar.dart';
import 'package:loadpage/interfaces/list_item.dart';
import 'package:loadpage/components/custom_list_view.dart';

class Usuarios extends StatefulWidget {
  const Usuarios({super.key});

  @override
  FormsState createState() => FormsState();
}

List<UserItem> data = [];

class FormsState extends State<Usuarios> {
  @override
  void initState() {
    super.initState();
    fetchData(); // Chame a função fetchData no momento apropriado, como o initState.
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://demo1810860.mockable.io/users'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        data.clear();
        for(int i = 0; i < jsonResponse.length; i++){
          UserItem item = UserItem(
            id: jsonResponse[i]['id'], 
            nome: jsonResponse[i]['nome'], 
            email: jsonResponse[i]['email'], 
            image: CustomImageInfo(details: jsonResponse[i]['image']['details'], url: jsonResponse[i]['image']['url']), 
            cpf: jsonResponse[i]['cpf']
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
      appBar: const CustomAppBar(title: "Usuarios"),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            const Text('Usuarios cadastrados',
                style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 50.0),
            Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: CustomListView(data: data)
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Usuarios extends StatefulWidget {
  const Usuarios({super.key});

  @override
  FormsState createState() => FormsState();
}

// List<dynamic> data = [
//   {
//     "id": 1,
//     "name": "Nicolas",
//     "email": "nichollaslimma@gmail.com",
//     "cpf": "000.000.000-00",
//     "senha": "senha"
//   },
//   {
//     "id": 2,
//     "name": "V",
//     "email": "v2077@gmail.com",
//     "cpf": "000.000.001-01",
//     "senha": "silverhand"
//   }
// ];

List<dynamic> data = [];

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
        data = jsonResponse['data'];
      });
    } else {
      print("Request Fail: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
      ),
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = data[index];
                  return GestureDetector(
                    onTap: () {
                      print("Item ${index + 1}");
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nome: ${item['nome']}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8.0),
                                    Text('CPF: ${item['cpf']}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8.0),
                                    Text('Email: ${item['email']}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

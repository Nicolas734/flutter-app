import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  FormsState createState() => FormsState();
}

List<dynamic> data = [
  {"id": 1, "name": "Pendrive", "preco": 19.00, "qtd": 2},
  {"id": 2, "name": "cyberpunk 2077", "preco": 59.99, "qtd": 10}
];

class FormsState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            const Text('Produtos cadastrados', style: TextStyle(fontSize: 25.0)),
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
                                    Text('Nome: ${item['name']}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8.0),
                                    Text(
                                        'Preço: ${item['preco'].toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8.0),
                                    Text(
                                        'Quantidade: ${item['qtd'].toStringAsFixed(2)}',
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

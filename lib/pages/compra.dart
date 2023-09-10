import 'package:flutter/material.dart';
import 'package:loadpage/components/custom_app_bar.dart';
import 'options.dart';


class Compra extends StatefulWidget {
  final String produto;
  const Compra({super.key, required this.produto});

  @override
  FormsState createState() =>  FormsState(produto: produto);
}

class FormsState extends State<Compra> {
  final TextEditingController _qtd = TextEditingController();
  final TextEditingController _prodController;

  FormsState({required String produto})
      : _prodController = TextEditingController(text: produto);

  void _realizarCompra(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Compra realizada com sucesso'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Options()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Compra"),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50.0),
            const Text('Produto', style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 40.0),
            SizedBox(
              width: 400,
              height: 600,
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _prodController,
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Produto',
                        prefixIcon: Icon(Icons.shopping_cart),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _qtd,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Quantidade de produtos',
                        prefixIcon: Icon(Icons.add_shopping_cart),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _realizarCompra(context);
                    },
                    child: const Text('Realizar Compra'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

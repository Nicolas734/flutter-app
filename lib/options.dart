import 'package:flutter/material.dart';
import 'produtos.dart';
import 'usuarios.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opções"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            const Text('Opções', style: TextStyle(fontSize: 30.0)),
            const SizedBox(height: 50.0),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Usuarios()),
                      );
                    },
                    child: const Text('Lista dos Usuários'),
                  ),
                  const SizedBox(height: 10.0), // Espaçamento entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Produtos()),
                      );
                    },
                    child: const Text('Lista dos Produtos'),
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

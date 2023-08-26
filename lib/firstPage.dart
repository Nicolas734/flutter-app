import 'package:flutter/material.dart';
import 'secondPage.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondPage(
                            title: 'Item Title',
                            description: 'Item description goes here',
                          )),
                );
              },
              child: const Text('Próxima'),
            ),
          ],
        ),
      ),
    );
  }
}

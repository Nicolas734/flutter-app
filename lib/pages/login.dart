import 'package:flutter/material.dart';
import 'options.dart';
import 'cadastro.dart';

// Classe que instância classe responsável por gerenciar estados
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  FormsState createState() => FormsState();
}

// classe que contém os widgets
class FormsState extends State<Login> {
  // é necessário um controller para interagir com
  // wigdget de entrada de dados
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  String _errorMessage = "";
  bool envio = false;
  bool next = false;

/*
  // simula envia de informação
  void _enviar() {
    String email = _email.text;
    String password = _password.text;

    // altera state textColor
    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    // altera cor da borda
    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    // define resposta
    setState(() {
      // não informou nome
      if (email == "" || password == "") {
        // altera cor do texto
        changeTextColor(Colors.red);
        // altera mensagem
        // alterar cor da borda
        changeBorderColor(Colors.red);
      } else {
        // ok, alterar dados para
        changeEnvio(true);
        changeTextColor(Colors.blue);
        changeBorderColor(Colors.grey);
      }
    });
  }
  */

  void changeNext(bool e) {
    setState(() {
      next = e;
    });
  }

  void changeBorderColor(Color newColor) {
    setState(() {
      borderColor = newColor;
    });
  }

  void changeTextColor(Color newColor) {
    setState(() {
      textColor = newColor;
    });
  }

  void _navegarParaHome() {
    String email = _email.text;
    String password = _password.text;
    changeNext(true);
    if (email != "" && password != "") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Options()),
      );
    } else {
      _errorMessage = "Por favor preencha os campos";
      changeBorderColor(Colors.red);
      changeTextColor(Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // barra do aplicativo
        title: const Text('Login'),
      ),
      body: Align(
        // corpo do aplicativo
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0), // um retângulo para separar widgets
            const Text(
              // label (texto)
              'Realize seu Login',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),

            const SizedBox(
                height: 16.0), // um retângulo contendo widget de entrada
            SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  controller: _email, // associa controle ao widget
                  keyboardType: TextInputType.text, // tipo de entrada
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Entre com email', //hint
                    prefixIcon: const Icon(Icons.email), //icon
                    enabledBorder: OutlineInputBorder(
                      //borda ao redor da entrada
                      borderSide: BorderSide(color: borderColor), //cor da borda
                    ), //quando receber o foco, altera cor da borda
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                )),

            const SizedBox(height: 16.0),
            SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  controller: _password,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Entre com a senha",
                    prefixIcon: const Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                )),

            const SizedBox(height: 16.0),
            // if ternário que controla exibição da resposta.
            // senão foi enviado, então apresenta botões
            // enviar e cancelar

            SizedBox(
                // botões
                width: 300,
                // Row determina que os widgets serão acrescentados
                // lado a lado
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _navegarParaHome,
                      child: const Text('Enviar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Forms()),
                        );
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ],
                )),
            !next
                ? const SizedBox.shrink()
                : const SizedBox.shrink(), // espaço vazio
            const SizedBox(height: 16.0),
            Text(
              "$_errorMessage ",
              style: TextStyle(fontSize: 24.0, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loadpage/components/custom_app_bar.dart';


// Classe que instância classe responsável por gerenciar estados
class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  FormsState createState() => FormsState();
}

// classe que contém os widgets
class FormsState extends State<Forms> {
  // é necessário um controller para interagir com
  // wigdget de entrada de dados
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  String _resultNome = "";
  String _resultEmail = "";
  String _resultCpf = "";
  String _resultPassword = "";
  bool envio = false;

  // simula envia de informação
  void _enviar() {
    String nome = _nome.text;
    String email = _email.text;
    String cpf = _cpf.text;
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
      if (nome == "" && email == "" && cpf == "" && password == "") {
        // altera cor do texto
        changeTextColor(Colors.red);
        // altera mensagem
        _resultNome = "Campo nome obrigatório";
        _resultEmail = "Campo email obrigatório";
        _resultCpf = " Campo CPF obrigatrio";
        _resultPassword = "Campo Senha obrigatorio";
        // alterar cor da borda
        changeBorderColor(Colors.red);
      } else {
        // ok, alterar dados para
        changeEnvio(true);
        changeTextColor(Colors.blue);
        changeBorderColor(Colors.grey);
        _resultNome = nome;
        _resultEmail = email;
        _resultCpf = cpf;
        _resultPassword = password;
      }
    });
  }

  // cancelar
  void _cancelar() {
    _nome.text = "";
    _email.text = "";
    _cpf.text = "";
    _password.text = "";
    String nome = _nome.text;
    String email = _email.text;
    String cpf = _cpf.text;
    String password = _password.text;
    // define resposta
    setState(() {
      _resultNome = nome;
      _resultEmail = email;
      _resultCpf = cpf;
      _resultPassword = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Cadastro"),
      body: Align(
        // corpo do aplicativo
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0), // um retângulo para separar widgets
            const Text(
              // label (texto)
              'Sample Input',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),

            const SizedBox(
                height: 16.0), // um retângulo contendo widget de entrada
            SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  controller: _nome, // associa controle ao widget
                  keyboardType: TextInputType.text, // tipo de entrada
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Entre com nome', //hint
                    prefixIcon:
                        const Icon(Icons.account_circle_outlined), //icon
                    enabledBorder: OutlineInputBorder(
                      //borda ao redor da entrada
                      borderSide: BorderSide(color: borderColor), //cor da borda
                    ), //quando receber o foco, altera cor da borda
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                )),

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

            const SizedBox(
                height: 16.0), // um retângulo contendo widget de entrada
            SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  controller: _cpf, // associa controle ao widget
                  keyboardType: TextInputType.text, // tipo de entrada
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Entre com o CPF', //hint
                    prefixIcon: const Icon(Icons.badge_outlined), //icon
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
            !envio
                ? SizedBox(
                    // botões
                    width: 300,
                    // Row determina que os widgets serão acrescentados
                    // lado a lado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _enviar, // executa _enviar
                          child: const Text('Enviar'),
                        ),
                        ElevatedButton(
                          onPressed: _cancelar, // executa _cancelar
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ))
                : const SizedBox.shrink(), // espaço vazio
            const SizedBox(height: 16.0),
            Text(
              'Resultado Nome: $_resultNome',
              style: TextStyle(fontSize: 24.0, color: textColor),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Resultado Email: $_resultEmail',
              style: TextStyle(fontSize: 24.0, color: textColor),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text('Resultado CPF: $_resultCpf',
                style: TextStyle(fontSize: 24.0, color: textColor)),
            const SizedBox(
              height: 16.0,
            ),
            Text('Resultado Senha: $_resultPassword',
                style: TextStyle(fontSize: 24.0, color: textColor))
          ],
        ),
      ),
    );
  }
}

String parseSenhaForAsterisk(int len) {
  String senha = "";
  for (int i = 0; i < 5; i++) {
    senha += "*";
  }
  return senha;
}

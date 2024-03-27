import 'package:flutter/material.dart';

class TelaCadastroView extends StatefulWidget {
  const TelaCadastroView({super.key});

  @override
  State<TelaCadastroView> createState() => _TelaCadastroViewState();
}

class _TelaCadastroViewState extends State<TelaCadastroView> {
  // chave form
  var formKey = GlobalKey<FormState>();
  var status = false;

  // controladores text input
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Cadastro"),
        backgroundColor: Colors.blue.shade400,
      ),
    );
  }
}

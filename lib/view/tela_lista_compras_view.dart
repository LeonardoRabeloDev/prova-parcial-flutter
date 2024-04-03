import 'package:execs/Model/Usuario.dart';
import 'package:flutter/material.dart';

class TelaListaComprasView extends StatefulWidget {
  const TelaListaComprasView({super.key});

  @override
  State<TelaListaComprasView> createState() => _TelaListaComprasViewState();
}

class _TelaListaComprasViewState extends State<TelaListaComprasView> {
  // chave form
  var formKey = GlobalKey<FormState>();
  var status = false;

  // controladores text input
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Usuario> lista =
        ModalRoute.of(context)!.settings.arguments as List<Usuario>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
      ),
    );
  }
}

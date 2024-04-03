import 'package:execs/Model/Usuario.dart';
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
    List<Usuario> lista = ModalRoute.of(context)!.settings.arguments as List<Usuario>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Cadastro"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // email input
                TextFormField(
                  controller: txtEmail,

                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),

                  // validacao

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe um valor";
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 30,
                ),

                // senha input
                TextFormField(
                  controller: txtSenha,

                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),

                  // validacao

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe um valor";
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 30,
                ),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      lista.add(Usuario(txtEmail.text, txtSenha.text));
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

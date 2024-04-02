import 'package:execs/Model/Usuario.dart';
import 'package:execs/view/caixa_dialogo.dart';
import 'package:flutter/material.dart';

class TelaLoginView extends StatefulWidget {
  const TelaLoginView({super.key});

  @override
  State<TelaLoginView> createState() => _TelaLoginViewState();
}

class _TelaLoginViewState extends State<TelaLoginView> {
  // chave form
  var formKey = GlobalKey<FormState>();

  // controladores text input
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  List<Usuario> lista = [];

  @override
  void initState() {
    lista.add(Usuario("admin", "admin"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
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
                // imagem
                Icon(
                  Icons.sentiment_satisfied,
                  size: 120,
                  color: Colors.blue.shade900,
                ),

                SizedBox(
                  height: 30,
                ),

                // text input 1
                TextFormField(
                  controller: txtEmail,

                  decoration: InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),

                  // validacao
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe um valor válido";
                    }

                    return null;
                  },
                ),

                SizedBox(
                  height: 30,
                ),

                // text input 2
                TextFormField(
                  controller: txtSenha,

                  decoration: InputDecoration(
                      labelText: "Senha", border: OutlineInputBorder()),

                  // validacao
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe um valor";
                    } else if (value.length < 4) {
                      return "Senha menor que 4 caracteres";
                    }

                    return null;
                  },
                ),

                SizedBox(
                  height: 30,
                ),

                // botao entrar
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // validado com sucesso

                      setState(() {
                        var email = txtEmail.text;
                        var senha = txtSenha.text;

                        print(email);
                        print(senha);
                        print(lista.length);
                        lista.forEach((usr) {
                          print("usr " + usr.getEmail());
                          print("usr " + usr.getSenha());
                          if (usr.getEmail() == email &&
                              usr.getSenha() == senha) {
                            CaixaDialogo().caixaDialogo(context, "opa", "opa");
                          }
                        });
                      });
                    } else {
                      // erro na validacao
                    }
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(fontSize: 36),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                // botao cadastrar
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "t2", arguments: {
                      "email": txtEmail.text,
                      "senha": txtSenha.text,
                    });
                  },
                  child: Text(
                    "Cadastrar-se",
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

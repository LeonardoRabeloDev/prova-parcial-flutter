import 'package:execs/Model/Lista.dart';
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
  bool flag = false;

  static List<Usuario> lista = [];

  static List<Lista> listas = [];

  @override
  void initState() {
    if (lista.isEmpty) {
      lista.add(Usuario("admin", "admin"));

      listas.add(Lista("Lista Jantar"));
      listas[0].addProduto("Salmão", 14.0, 3);
      listas[0].addProduto("Vinho", 38.0, 1);

      listas.add(Lista("Lista Mensal"));
      listas[1].addProduto("Arroz", 28.0, 4);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var email = txtEmail.text;
    var senha = txtSenha.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela de Login"),
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
                  Icons.shopping_cart_outlined,
                  size: 120,
                  color: Colors.blue.shade900,
                ),

                const SizedBox(
                  height: 30,
                ),

                // text input 1
                TextFormField(
                  controller: txtEmail,

                  decoration: const InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),

                  // validacao
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe um valor válido";
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: 30,
                ),

                // text input 2
                TextFormField(
                  controller: txtSenha,

                  decoration: const InputDecoration(
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

                const SizedBox(
                  height: 30,
                ),

                // botao entrar
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // validado com sucesso

                      setState(() {
                        email = txtEmail.text;
                        senha = txtSenha.text;
                        flag = false;

                        lista.forEach((usr) {
                          if (usr.getEmail() == email &&
                              usr.getSenha() == senha) {
                            flag = true;
                            Future.delayed(Duration.zero, () {
                              caixaDialogo(context, "Logado com sucesso!", "");
                            });

                            Navigator.pushNamed(context, "t3",
                                arguments: listas);
                          }

                          if (flag == false) {
                            caixaDialogo(context, "Usuário não encontrado",
                                "Tente novamente");
                          }
                        });
                      });
                    } else {
                      // erro na validacao
                    }
                  },
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 36),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                // botao cadastrar
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "t2", arguments: lista);
                  },
                  child: const Text(
                    "Cadastrar-se",
                    style: TextStyle(fontSize: 36),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "t5");
                  },
                  child: const Text(
                    "Sobre",
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

import 'package:flutter/material.dart';

class TelaSobreView extends StatefulWidget {
  const TelaSobreView({super.key});

  @override
  State<TelaSobreView> createState() => _TelaSobreViewState();
}

class _TelaSobreViewState extends State<TelaSobreView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            "Projeto desenvolvido para obtenção de nota na disciplina Novas Tecnologias de Informação e Comunicação, " +
            "ministradas pelo professor Doutor Rodrigo de Oliveira Plotze.\n" +
            "O projeto foi feito utilizando o framework Flutter, construído na linguagem Dart e seguindo o " +
            "Paradigma de Orientação a Objetos, conforme conteúdo das aulas.\n\n"
            "Aluno: Leonardo Guimarães Rabelo\nCódigo: 836404\n7a. etapa do curso de Engenharia da Computação - UNAERP.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

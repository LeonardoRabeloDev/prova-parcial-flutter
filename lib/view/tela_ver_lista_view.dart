import 'package:execs/Model/Lista.dart';
import 'package:flutter/material.dart';

class TelaVerListaView extends StatefulWidget {
  const TelaVerListaView({super.key});

  @override
  State<TelaVerListaView> createState() => _TelaVerListaViewState();
}

class _TelaVerListaViewState extends State<TelaVerListaView> {
  @override
  Widget build(BuildContext context) {
    Lista lista = ModalRoute.of(context)!.settings.arguments as Lista;

    return Scaffold(
      appBar: AppBar(
        title: Text(lista.getNome()),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: lista.createList(),
      ),
    );
  }
}

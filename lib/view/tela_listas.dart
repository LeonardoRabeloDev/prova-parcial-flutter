import 'package:execs/Model/Lista.dart';
import 'package:flutter/material.dart';

class TelaListasView extends StatefulWidget {
  const TelaListasView({super.key});

  @override
  State<TelaListasView> createState() => _TelaListasViewState();
}

class _TelaListasViewState extends State<TelaListasView> {
  List<Lista> listas = [];

  @override
  void initState() {
    listas.add(Lista("Lista de compras"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: listas.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text('${listas[index].nome}'),
            subtitle: Text('Items: ${listas[index].getLength()}'),

            //
            // Navegar para View dos Municípios
            //
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, "t4", arguments: listas[index]);
            },
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

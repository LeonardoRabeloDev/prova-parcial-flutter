import 'package:execs/Model/Lista.dart';
import 'package:execs/view/caixa_dialogo.dart';
import 'package:execs/view/caixa_input.dart';
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
    listas.add(Lista("Lista Jantar"));
    listas[0].addProduto("Salmão", 14.0);
    listas[0].addProduto("Vinho", 38.0);

    listas.add(Lista("Lista Mensal"));
    listas[1].addProduto("Arroz", 28.0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas cadastradas"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: listas.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.shopping_bag_outlined),
                title: Text('${listas[index].nome}'),
                subtitle: Text('Items: ${listas[index].getLength()}'),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "t4", arguments: listas[index]);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

            caixaInput(context, listas, setState);
          
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}

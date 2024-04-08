import 'package:execs/Model/Lista.dart';
import 'package:execs/view/caixa_input_lista.dart';
import 'package:flutter/material.dart';

class TelaListasView extends StatefulWidget {
  const TelaListasView({super.key});

  @override
  State<TelaListasView> createState() => _TelaListasViewState();
}

class _TelaListasViewState extends State<TelaListasView> {

  @override
  Widget build(BuildContext context) {
    List<Lista> listas =
        ModalRoute.of(context)!.settings.arguments as List<Lista>;


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

            caixaInputLista(context, listas, setState);
          
        },
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

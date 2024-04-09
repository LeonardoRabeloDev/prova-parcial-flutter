import 'package:execs/Model/Produto.dart';
import 'package:flutter/material.dart';

class Lista {
  final String nome;
  final List<Produto> lista = [];

  Lista(this.nome);

  getNome() {
    return this.nome;
  }

  getLista() {
    return this.lista;
  }

  getLength() {
    return this.lista.length;
  }

  addProduto(nome, preco, quantidade) {
    lista.add(Produto(nome, preco, quantidade));
  }

  createList(cb) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Nome: ${lista[index].getNome()}"),
              subtitle: Text(
                  "Preço: R\$${lista[index].getPrecoMoeda()}\nQuantidade: ${lista[index].getQuantidade()}"),
              onLongPress: () {
                lista.remove(lista[index]);
                cb(() {});
              },
            ),
          );
        });
  }
}

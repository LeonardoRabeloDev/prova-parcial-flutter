import 'package:execs/Model/Produto.dart';
import 'package:execs/view/caixa_input_editar_produto.dart';
import 'package:flutter/material.dart';

class Lista {
  String nome;
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

  setNome(String nome) {
    this.nome = nome;
  }

  addProduto(nome, preco, quantidade) {
    lista.add(Produto(nome, preco, quantidade));
  }

  createList(cb) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          bool isChecked = lista[index].isComprado();
          Icon ckb = isChecked
              ? const Icon(Icons.check_box)
              : const Icon(Icons.check_box_outline_blank);

          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Nome: ${lista[index].getNome()}"),
              subtitle: Text(
                  "Preço: R\$${lista[index].getPrecoMoeda()}\nQuantidade: ${lista[index].getQuantidade()}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        caixaInputEditarProduto(context, lista[index], cb);
                      },
                      icon: const Icon(Icons.edit)),
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      cb(() {
                        lista[index].setComprado();
                      });
                    },
                    child: ckb,
                  ),
                ],
              ),
              onLongPress: () {
                lista.remove(lista[index]);
                cb(() {});
              },
            ),
          );
        });
  }
}

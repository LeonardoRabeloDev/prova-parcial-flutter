import 'package:execs/Model/Lista.dart';
import 'package:flutter/material.dart';

Future<dynamic> caixaInputEditarLista(context, Lista lista, cb) {
  var formKey = GlobalKey<FormState>();

  var txtNomeLista = TextEditingController();
  txtNomeLista.text = lista.getNome();

  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text("Editar lista"),
      actions: [
        Form(
          key: formKey,
          child: Column(
            children: [
              // email input
              TextFormField(
                controller: txtNomeLista,

                decoration: const InputDecoration(
                  labelText: "Nome da lista",
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

              const SizedBox(
                height: 30,
              ),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(140, 40),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.yellow,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    lista.setNome(txtNomeLista.text);

                    cb(() {});

                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Editar",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:execs/Model/Lista.dart';
import 'package:flutter/material.dart';

Future<dynamic> caixaInput(context, lista, fn) {
  var formKey = GlobalKey<FormState>();

  var txtNomeLista = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Adicionar lista"),
      actions: [
        Form(
          key: formKey,
          child: Column(
            children: [
              // email input
              TextFormField(
                controller: txtNomeLista,

                decoration: InputDecoration(
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

              SizedBox(
                height: 30,
              ),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(140, 40),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.yellow,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {

                    lista.add(Lista(txtNomeLista.text));
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Adicionar",
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

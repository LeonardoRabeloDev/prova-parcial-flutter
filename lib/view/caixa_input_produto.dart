import 'package:flutter/material.dart';

Future<dynamic> caixaInputProduto(context, lista, cb) {
  var formKey = GlobalKey<FormState>();

  var txtNome = TextEditingController();
  var txtPreco = TextEditingController();
  var txtQuantidade = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text("Adicionar lista"),
      actions: [
        Form(
          key: formKey,
          child: Column(
            children: [
              // nome input
              TextFormField(
                controller: txtNome,

                decoration: const InputDecoration(
                  labelText: "Nome do produto",
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

              // preco input
              TextFormField(
                controller: txtPreco,

                decoration: const InputDecoration(
                  labelText: "Preço",
                  border: OutlineInputBorder(),
                ),

                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),

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

              // quantidade input
              TextFormField(
                controller: txtQuantidade,

                decoration: const InputDecoration(
                  labelText: "Quantidade",
                  border: OutlineInputBorder(),
                ),

                keyboardType: TextInputType.number,

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
                    lista.addProduto(
                        txtNome.text,
                        double.parse(txtPreco.text.replaceFirst(",", ".")),
                        int.parse(txtQuantidade.text)
                    );

                    cb(() {});

                    Navigator.pop(context);
                  }
                },
                child: const Text(
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

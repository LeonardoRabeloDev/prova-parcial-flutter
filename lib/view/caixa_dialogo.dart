import 'package:flutter/material.dart';

Future<dynamic> caixaDialogo(context, titulo, mensagem) {
  
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Ok'),
          child: Text('Ok'),
        ),
      ],
    ),
  );
}

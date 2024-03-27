import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/tela_login_view.dart';
import 'view/tela_cadastro_view.dart';
import 'view/tela_lista_compras_view.dart';
import 'view/tela_sobre_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tela de Login",

      // rotas de navegação

      initialRoute: "t1",
      routes: {
        "t1": (context) => TelaLoginView(),
        "t2": (context) => TelaCadastroView(),
        // "t3": (context) => TelaListaComprasView(),
        // "t4": (context) => TelaSobreView(),
      },
    );
  }
}

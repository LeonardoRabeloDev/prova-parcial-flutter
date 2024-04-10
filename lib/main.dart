import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/tela_login_view.dart';
import 'view/tela_cadastro_view.dart';
import 'view/tela_listas.dart';
import 'view/tela_ver_lista_view.dart';
import 'view/tela_sobre_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
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
        "t1": (context) => const TelaLoginView(),
        "t2": (context) => const TelaCadastroView(),
        "t3": (context) => const TelaListasView(),
        "t4": (context) => const TelaVerListaView(),
        "t5": (context) => const TelaSobreView(),
      },
    );
  }
}

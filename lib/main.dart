import 'package:doacao_front/pages/conf_page.dart';
import 'package:doacao_front/pages/home_page.dart';
import 'package:doacao_front/pages/login_page.dart';
import 'package:doacao_front/pages/recuperar_page.dart';
import 'package:doacao_front/pages/registrar_page.dart';
import 'package:doacao_front/service_reg.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      title: 'rotas',
      initialRoute: '/',
      routes: {
        '/': (context) => Material(child: Scaffold(body: ConfPage())),
        '/home': (context) => Material(child: Scaffold(body: HomePage())),
        '/registrar': (context) => Material(child: Scaffold(body: const RegistrarPage())),
        '/login': (context) => Material(child: Scaffold(body: const LoginPage())),
        '/recupera': (context) => Material(child: Scaffold(body: const RecuperarSenhaPage())),
      },
    );
  }
}

import 'package:doacao_front/controllers/home_page_controller.dart';
import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  var usuarioID = getIt<ConfService>().getUsuarioID();
  var token = getIt<ConfService>().getToken();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await logout(context);
                setState(() {});
              },
              child: Text('Sair'),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              child: const Text('Home'),
            ),
          ],
        ));
  }
}

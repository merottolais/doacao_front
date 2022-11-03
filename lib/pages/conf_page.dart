import 'package:doacao_front/controllers/conf_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfPage extends StatefulWidget {
  ConfPage({super.key});

  @override
  State<ConfPage> createState() => _ConfPageState();
}

class _ConfPageState extends State<ConfPage> {
  final _form = GlobalKey<FormState>();
  final _ip = TextEditingController();
  final _porta = TextEditingController();

  var mostrarBotaoLogin = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              controller: _ip,
              decoration: InputDecoration(
                labelText: 'IP',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o IP';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _porta,
              decoration: InputDecoration(
                labelText: 'Porta',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a porta';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_form.currentState!.validate()) {
                  await registrarIp(_ip.text, _porta.text);
                  mostrarBotaoLogin = true;
                  setState(() {});
                }
              },
              child: Text('Registrar'),
            ),
            if (mostrarBotaoLogin) ...[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Ir para o Login"),
              )
            ]
          ],
        ),
      ),
    );
  }
}

import 'package:doacao_front/controllers/login_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecuperarSenhaPage extends StatefulWidget {
  const RecuperarSenhaPage({super.key});

  @override
  State<RecuperarSenhaPage> createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  final _form = GlobalKey<FormState>();
  final _cpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              controller: _cpf,
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o CPF';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_form.currentState!.validate()) {
                  await recuperaSenha(_cpf.text, context);
                  setState(() {});
                }
              },
              child: Text('Recuperar Senha'),
            ),
          ],
        ),
      ),
    );
  }
}

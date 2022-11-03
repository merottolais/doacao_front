import 'package:doacao_front/controllers/registrar_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({super.key});

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final _form = GlobalKey<FormState>();
  final _cpf = TextEditingController();
  final _senha = TextEditingController();
  final _nome = TextEditingController();
  final _telefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              controller: _nome,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome';
                }
                return null;
              },
            ),
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
            TextFormField(
              controller: _senha,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a senha';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _telefone,
              decoration: InputDecoration(
                labelText: 'Telefone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o telefone';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_form.currentState!.validate()) {
                  await registrar(_nome.text, _telefone.text, _senha.text, _cpf.text, context);
                  setState(() {});
                }
              },
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

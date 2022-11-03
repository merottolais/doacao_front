import 'package:doacao_front/controllers/login_page_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _cpf = TextEditingController();
  final _senha = TextEditingController();
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
            ElevatedButton(
              onPressed: () async {
                if (_form.currentState!.validate()) {
                  await login(_cpf.text, _senha.text, context);
                  setState(() {});
                }
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registrar');
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}

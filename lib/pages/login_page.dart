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
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 500,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_form.currentState!.validate()) {
                                    await login(_cpf.text, _senha.text, context);
                                    setState(() {});
                                  }
                                },
                                child: Text('Login'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/registrar');
                              },
                              child: Text('Registrar'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.pushNamed(context, '/recuperaSenha');
                              },
                              child: Text('Recuperar senha'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

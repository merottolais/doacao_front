import 'package:doacao_front/controllers/recupera_page_controller.dart';
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
  String? senha;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      'Recuperar Senha',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Column(
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
                                        await recuperaSenha(_cpf.text, context);
                                        setState(() {});
                                      }
                                    },
                                    child: Text('Recuperar Senha'),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Text('Voltar'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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

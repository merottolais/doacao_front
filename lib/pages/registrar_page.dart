import 'package:doacao_front/controllers/registrar_page_controller.dart';
import 'package:doacao_front/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegistrarPage extends StatefulWidget {
  RegistrarPage({super.key, required this.update});

  bool update;

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final _form = GlobalKey<FormState>();
  final _cpf = TextEditingController();
  final _senha = TextEditingController();
  final _nome = TextEditingController();
  final _telefone = TextEditingController();
  String? id;

  void initState() {
    super.initState();
    if (widget.update) {
      obterUsuario().then((value) {
        _cpf.text = value!.cpf;
        _nome.text = value.nome;
        _telefone.text = value.telefone;
        id = value.id.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 500,
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      widget.update ? 'Atualizar' : 'Registrar',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
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
                      if (value == null || value.isEmpty && !widget.update) {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          if (widget.update) ...[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_form.currentState!.validate()) {
                                    await atualizar(_nome.text, _telefone.text, _senha.text, _cpf.text, context);
                                    setState(() {});
                                  }
                                },
                                child: Text('Atualizar'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: Text('Voltar'),
                            ),
                          ] else ...[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_form.currentState!.validate()) {
                                    await registrar(_nome.text, _telefone.text, _senha.text, _cpf.text, context);
                                    setState(() {});
                                  }
                                },
                                child: Text('Salvar'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
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
                        ]),
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

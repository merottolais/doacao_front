import 'package:doacao_front/controllers/doacao_controller.dart';
import 'package:doacao_front/controllers/registrar_page_controller.dart';
import 'package:doacao_front/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoacaoPage extends StatefulWidget {
  DoacaoPage({super.key});

  @override
  State<DoacaoPage> createState() => _DoacaoPageState();
}

class _DoacaoPageState extends State<DoacaoPage> {
  final _form = GlobalKey<FormState>();
  final _descricao = TextEditingController();
  final _unidade = TextEditingController();
  String? id;

  void initState() {
    super.initState();
    // if (widget.update) {
    //   obterUsuario().then((value) {
    //     _descricao.text = value!.cpf;
    //     _nome.text = value.nome;
    //     _telefone.text = value.telefone;
    //     id = value.id.toString();
    //   });
    // }
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
                      'Cadastrar Doação',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _descricao,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a descrição';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _unidade,
                    decoration: InputDecoration(
                      labelText: 'Unidade',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a unidade';
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
                                    await cadastrarDoacao(_descricao.text, _unidade.text, context);
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
                                Navigator.pushNamed(context, '/home');
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
            ),
          ),
        ),
      ),
    );
  }
}

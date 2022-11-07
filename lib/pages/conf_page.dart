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
                      'Doações',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
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
                                    await registrarIp(_ip.text, _porta.text);
                                    mostrarBotaoLogin = true;
                                    setState(() {});
                                  } else {
                                    mostrarBotaoLogin = false;
                                    setState(() {});
                                  }
                                },
                                child: Text('Registrar IP'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_form.currentState!.validate()) {
                                  await registrarIp(_ip.text, _porta.text);
                                  mostrarBotaoLogin = true;
                                  setState(() {});
                                } else {
                                  mostrarBotaoLogin = false;
                                  setState(() {});
                                }
                              },
                              child: const Icon(Icons.autorenew),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: mostrarBotaoLogin,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text("Ir para o Login"),
                            ),
                          ),
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

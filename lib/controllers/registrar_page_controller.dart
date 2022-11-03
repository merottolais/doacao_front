import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/registrar_service.dart';
import 'package:flutter/material.dart';

registrar(String name, String telefone, String senha, String cpf, BuildContext context) async {
  var response = await getIt<RegistrarService>().registrar(name, telefone, senha, cpf);

  if (response['status'] == 200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Usuário cadastrado com sucesso!'),
      backgroundColor: Colors.green,
    ));

    Navigator.pushNamed(context, '/login');
  } else {
    var mensagem = response['body']['mensagem'] ?? 'Erro desconhecido';

    var snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:doacao_front/services/login_service.dart';
import 'package:flutter/material.dart';

login(String cpf, String senha, BuildContext context) async {
  var response = await getIt<LoginService>().login(cpf, senha);

  if (response['status'] == 200) {
    getIt<ConfService>().setUsuarioID(response['body']['id'].toString());
    getIt<ConfService>().setToken(response['body']['token']);

    Navigator.pushNamed(context, '/home');
  } else {
    var mensagem = response['body']['mensagem'] ?? 'Erro desconhecido';

    var snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

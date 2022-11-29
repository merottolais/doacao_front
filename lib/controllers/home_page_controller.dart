import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:doacao_front/services/login_service.dart';
import 'package:flutter/material.dart';

logout(BuildContext context) async {
  var usuarioID = await getIt<ConfService>().getUsuarioID();
  var token = await getIt<ConfService>().getToken();

  var response = await getIt<LoginService>().logout(usuarioID, token);

  if (response['status'] == 200) {
    Navigator.pushNamed(context, '/login');
    getIt<ConfService>().limparDados();
  } else {
    var mensagem = response['body']['mensagem'] ?? 'Erro desconhecido';
  }
}

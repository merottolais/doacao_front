import 'package:doacao_front/models/user_model.dart';
import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:doacao_front/services/usuario_service.dart';
import 'package:flutter/material.dart';

registrar(String name, String telefone, String senha, String cpf, BuildContext context) async {
  var response = await getIt<UsuarioService>().registrar(name, telefone, senha, cpf);

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

Future<User?> obterUsuario() async {
  var response = await getIt<UsuarioService>().getUsuario();

  if (response['status'] == 200) {
    User user = User();
    user.cpf = response['body']['cpf'];
    user.nome = response['body']['nome'];
    user.telefone = response['body']['telefone'];

    user.id = 0;

    return user;
  } else {
    return null;
  }
}

atualizar(String name, String telefone, String? senha, String cpf, BuildContext context) async {
  var response = await getIt<UsuarioService>().atualizar(name, telefone, senha, cpf);

  if (response['status'] == 200) {
    var token = response['body']['token'];
    await getIt<ConfService>().setToken(token);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Usuário atualizado com sucesso!'),
      backgroundColor: Colors.green,
    ));

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

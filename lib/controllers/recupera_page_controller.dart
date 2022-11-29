import 'package:another_flushbar/flushbar.dart';
import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

recuperaSenha(String cpf, BuildContext context) async {
  var response = await getIt<LoginService>().recuperaSenha(cpf);

  String conteudo;

  if (response['status'] == 200) {
    conteudo = "Senha: ${response['body']['senha']}";
  } else {
    conteudo = response['body']['mensagem'] ?? 'Erro desconhecido';
  }

  AlertDialog alert = AlertDialog(
    title: Text("Recuperar senha"),
    content: Text(conteudo),
    actions: [
      TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      Visibility(
        visible: response['status'] == 200,
        child: IconButton(
          icon: Icon(Icons.copy),
          color: Colors.deepPurple,
          iconSize: 20,
          splashRadius: 20,
          onPressed: () {
            Clipboard.setData(ClipboardData(text: response['body']['senha']));
            Navigator.pushNamed(context, '/login');
            Flushbar(
              backgroundColor: Colors.green,
              message: "Senha copiada para a área de transferência",
              duration: Duration(seconds: 3),
            ).show(context);
          },
        ),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  return "";
}

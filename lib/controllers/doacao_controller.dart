import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/doacao_service.dart';
import 'package:flutter/material.dart';

cadastrarDoacao(String descricao, String unidade, BuildContext context) async {
  var response = await getIt<DoacaoService>().cadastrar(descricao, unidade);

  if (response['status'] == 200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Doação cadastrada com sucesso!'),
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

getDoacoes() async {
  var doacoes = await getIt<DoacaoService>().getDoacoes();
  return doacoes['body']['lista'];
}

getMinhasDoacoes() async {
  var doacoes = await getIt<DoacaoService>().getMinhasDoacoes();
  return doacoes['body']['lista'];
}

receberDoacoes(context, int idDoacao) async {
  var response = await getIt<DoacaoService>().receberDoacao(idDoacao);

  if (response['status'] == 200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Doação recebida com sucesso!'),
      backgroundColor: Colors.green,
    ));
  } else {
    var mensagem = response['body']['mensagem'] ?? 'Erro desconhecido';

    var snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

deletarDoacoes(context, int idDoacao) async {
  var response = await getIt<DoacaoService>().deletarDoacao(idDoacao);

  if (response['status'] == 200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Doação deletada com sucesso!'),
      backgroundColor: Colors.green,
    ));
  } else {
    var mensagem = response['body']['mensagem'] ?? 'Erro desconhecido';

    var snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

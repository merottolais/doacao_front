import 'package:doacao_front/models/conf_model.dart';
import 'package:doacao_front/services/http_service.dart';
import 'package:flutter/material.dart';

void main() async {
  //runApp(const MyApp());

  Conf conf = Conf();

  conf.ip = "192.168.1.9";
  conf.porta = "8080";

  var resposta;

  HTTPService httpService = HTTPService();

  /* print("1233");

  Map<String, dynamic> data = {"nome": "teste", "cpf": "11", "telefone": "22", "senha": "33"};

  var negocio = await httpService.postRequest(conf, "usuarios", data);

  print("O negocio vai ser: $negocio");

  print(negocio);
*/

  Map<String, dynamic> data = {"cpf": "11"};

  var negocio = await httpService.getRequest(conf, "recupera_senha", data);

  print("O negocio vai ser: $negocio");

  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

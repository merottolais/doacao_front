import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:doacao_front/services/http_service.dart';

class DoacaoService {
  Future<Map<String, dynamic>> cadastrar(String descricao, String unidade) async {
    var usuarioID = await getIt<ConfService>().getUsuarioID();

    Map<String, dynamic> data = {
      'descricao': descricao,
      'unidade': unidade,
      'idDoador': usuarioID,
    };

    Map<String, dynamic> response = await getIt<HTTPService>().postRequest('doacoes', data);

    return response;
  }

  Future<Map<String, dynamic>> getDoacoes() async {
    var idDoador = await getIt<ConfService>().getUsuarioID();

    Map<String, dynamic> data = {
      'idDoador': idDoador,
    };

    Map<String, dynamic> response = await getIt<HTTPService>().getRequest('doacoes', data);

    return response;
  }

  Future<Map<String, dynamic>> getMinhasDoacoes() async {
    var idDoador = await getIt<ConfService>().getUsuarioID();

    Map<String, dynamic> data = {};

    Map<String, dynamic> response = await getIt<HTTPService>().getRequest('doacoes/$idDoador', data);

    return response;
  }

  Future<Map<String, dynamic>> receberDoacao(int idDoacao) async {
    var idDoador = await getIt<ConfService>().getUsuarioID();

    Map<String, dynamic> data = {
      "idDoador": idDoador,
      "idDoacao": idDoacao.toString(),
    };

    Map<String, dynamic> response = await getIt<HTTPService>().postRequest('receber', data);

    return response;
  }

  Future<Map<String, dynamic>> deletarDoacao(int idDoacao) async {
    var idDoador = await getIt<ConfService>().getUsuarioID();

    Map<String, dynamic> data = {
      "idDoador": idDoador,
    };

    Map<String, dynamic> response = await getIt<HTTPService>().deleteRequest('doacoes/$idDoacao', data);

    return response;
  }
}

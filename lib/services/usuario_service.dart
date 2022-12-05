import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:doacao_front/services/http_service.dart';

class UsuarioService {
  Future<Map<String, dynamic>> registrar(String name, String telefone, String senha, String cpf) async {
    Map<String, dynamic> data = {
      'nome': name,
      'telefone': telefone,
      'senha': senha,
      'cpf': cpf,
    };

    Map<String, dynamic> response = await getIt<HTTPService>().postRequest('usuarios', data);

    return response;
  }

  Future<Map<String, dynamic>> getUsuario() async {
    Map<String, dynamic> data = {};

    String usuarioID = await getIt<ConfService>().getUsuarioID();

    Map<String, dynamic> response = await getIt<HTTPService>().getRequest('usuarios/$usuarioID', data);

    return response;
  }

  Future<Map<String, dynamic>> atualizar(String name, String telefone, String? senha, String cpf) async {
    Map<String, dynamic> data = {
      'nome': name,
      'telefone': telefone,
      'senha': senha,
      'cpf': cpf,
    };

    String usuarioID = await getIt<ConfService>().getUsuarioID();

    Map<String, dynamic> response = await getIt<HTTPService>().putRequest('usuarios/$usuarioID', data);

    return response;
  }
}

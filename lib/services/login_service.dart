import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/http_service.dart';

class LoginService {
  Future<Map<String, dynamic>> login(String cpf, String senha) async {
    Map<String, dynamic> data = {
      'cpf': cpf,
      'senha': senha,
    };
    Map<String, dynamic> response = await getIt<HTTPService>().postRequest('login', data);

    return response;
  }

  Future<Map<String, dynamic>> logout(String usuarioID, String token) async {
    Map<String, dynamic> data = {
      'token': token,
    };
    Map<String, dynamic> response = await getIt<HTTPService>().getRequest('logon/$usuarioID', data);

    return response;
  }

  Future<Map<String, dynamic>> recuperaSenha(String cpf) async {
    Map<String, dynamic> data = {};
    Map<String, dynamic> response = await getIt<HTTPService>().getRequest('recupera_senha/$cpf', data);

    return response;
  }
}

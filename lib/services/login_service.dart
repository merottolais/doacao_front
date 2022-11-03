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
}

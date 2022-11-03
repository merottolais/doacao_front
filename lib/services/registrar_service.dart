import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/http_service.dart';

class RegistrarService {
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
}

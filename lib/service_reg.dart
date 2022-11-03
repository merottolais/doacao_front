import 'package:doacao_front/pages/registrar_page.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:doacao_front/services/http_service.dart';
import 'package:doacao_front/services/login_service.dart';
import 'package:doacao_front/services/registrar_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ConfService>(ConfService());
  getIt.registerSingleton<HTTPService>(HTTPService());
  getIt.registerSingleton<LoginService>(LoginService());
  getIt.registerSingleton<RegistrarService>(RegistrarService());
}

import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';

registrarIp(ip, porta) async {
  await getIt<ConfService>().setIp(ip);
  await getIt<ConfService>().setPorta(porta);
}

import 'package:doacao_front/models/conf_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfService {
  final chaveip = "chaveip";
  final chaveporta = "chaveporta";
  final chavetoken = "chavetoken";
  final chaveusuarioID = "chaveusuarioID";

  //set ip
  Future<void> setIp(String ip) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(chaveip, ip);
  }

  //get ip
  Future<String> getIp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(chaveip) ?? "";
  }

  //set porta

  Future<void> setPorta(String porta) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(chaveporta, porta);
  }

  //get porta
  Future<String> getPorta() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(chaveporta) ?? "";
  }

  //set token
  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(chavetoken, token);
  }

  //get token
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(chavetoken) ?? "";
  }

  //set usuarioID
  Future<void> setUsuarioID(String usuarioID) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(chaveusuarioID, usuarioID);
  }

  //get usuarioID
  Future<String> getUsuarioID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(chaveusuarioID) ?? "";
  }

  //limpar dados
  Future<void> limparDados() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  //verificar se o usuario esta logado
  Future<bool> isLogado() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(chaveusuarioID) != null;
  }

  //get Conf
  Future<Conf> getConf() async {
    final prefs = await SharedPreferences.getInstance();
    return Conf(
      ip: prefs.getString(chaveip) ?? "",
      porta: prefs.getString(chaveporta) ?? "",
      token: prefs.getString(chavetoken) ?? "",
      usuarioID: prefs.getString(chaveusuarioID) ?? "",
    );
  }
}

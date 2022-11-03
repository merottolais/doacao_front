import 'package:doacao_front/models/conf_model.dart';
import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPService {
  Future<Map<String, dynamic>> postRequest(String url, Map<String, dynamic> data) async {
    Conf conf = await getIt<ConfService>().getConf();
    var requestUrl = Uri.parse(
      'http://${conf.ip}:${conf.porta}/$url',
    );

    var body = json.encode(data);

    var response = await http.post(
      requestUrl,
      headers: {
        "Content-Type": "application/json",
        "token": conf.token,
      },
      body: body,
    );

    Map<String, dynamic> jsonResponse = <String, dynamic>{};

    jsonResponse['body'] = json.decode(response.body);
    jsonResponse['status'] = response.statusCode;

    return jsonResponse;
  }

  Future<Map<String, dynamic>> getRequest(String url, Map<String, dynamic> data) async {
    Conf conf = await getIt<ConfService>().getConf();

    var requestUrl = Uri.parse(
      'http://${conf.ip}:${conf.porta}/$url',
    );

    var request = http.Request('GET', requestUrl)
      ..headers.addAll({
        "Content-Type": "application/json",
        "token": conf.token,
      });

    request.body = jsonEncode(data);
    http.StreamedResponse response = await request.send();

    var resposta = await http.Response.fromStream(response);

    Map<String, dynamic> jsonResponse = <String, dynamic>{};

    jsonResponse['body'] = json.decode(resposta.body);
    jsonResponse['status'] = resposta.statusCode;

    return jsonResponse;
  }
}

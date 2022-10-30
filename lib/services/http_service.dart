import 'package:doacao_front/models/conf_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPService {
  Future<Map<String, dynamic>> postRequest(Conf conf, String url, Map<String, dynamic> data) async {
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
    jsonResponse['statusCode'] = response.statusCode;

    return jsonResponse;
  }

  Future<Map<String, dynamic>> getRequest(Conf conf, String url, Map<String, dynamic> data) async {
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
    jsonResponse['statusCode'] = resposta.statusCode;

    return jsonResponse;
  }
}

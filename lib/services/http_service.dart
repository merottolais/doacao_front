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

    jsonResponse['status'] = response.statusCode;

    if (response.body.isEmpty) {
      jsonResponse['body'] = <String, dynamic>{};
    } else {
      jsonResponse['body'] = json.decode(response.body);
    }

    return jsonResponse;
  }

  Future<Map<String, dynamic>> getRequest(String url, Map<String, dynamic> parameters) async {
    Conf conf = await getIt<ConfService>().getConf();

    var requestUrl = Uri.parse(
      'http://${conf.ip}:${conf.porta}/$url',
    );

    requestUrl = requestUrl.replace(queryParameters: parameters);

    var response = await http.get(
      requestUrl,
      headers: {
        "Content-Type": "application/json",
        "token": conf.token,
      },
    );

    Map<String, dynamic> jsonResponse = <String, dynamic>{};

    jsonResponse['status'] = response.statusCode;

    if (response.body.isEmpty) {
      jsonResponse['body'] = <String, dynamic>{};
    } else {
      jsonResponse['body'] = json.decode(response.body);
    }

    return jsonResponse;
  }

  Future<Map<String, dynamic>> putRequest(String url, Map<String, dynamic> data) async {
    Conf conf = await getIt<ConfService>().getConf();

    var requestUrl = Uri.parse(
      'http://${conf.ip}:${conf.porta}/$url',
    );

    var body = json.encode(data);

    var response = await http.put(
      requestUrl,
      headers: {
        "Content-Type": "application/json",
        "token": conf.token,
      },
      body: body,
    );

    Map<String, dynamic> jsonResponse = <String, dynamic>{};

    jsonResponse['status'] = response.statusCode;

    if (response.body.isEmpty) {
      jsonResponse['body'] = <String, dynamic>{};
    } else {
      jsonResponse['body'] = json.decode(response.body);
    }

    return jsonResponse;
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bkautomobiles/Base_client_Services/api_exceptions_handaling.dart';
import 'package:bkautomobiles/View_Details/view_details_model.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  final TIME_OUT_DURATION = 20;

  //GET
  Future<List<Get>> get(String Url) async {
    var uri = Uri.parse(Url);

    try {
      var response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("API not responding", uri.toString());
    }
  }

  //POST METHOD
  Future<dynamic> post(String Url, dynamic payLoadobj) async {
    var uri = Uri.parse(Url);
    var payload = json.decode(payLoadobj);

    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException("API not responding", uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;

      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'error occured with code ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}

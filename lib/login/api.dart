import 'dart:convert';

import 'package:http/http.dart' as http;

var response;

Future logInUser(String email, String password) async {
  var URL = Uri.parse("http://192.168.1.119/bkautomobiles/login_check.php");
  response = await http.post(URL, body: {"email": email, "password": password});

  var convertedData = jsonDecode(response.body);

  return convertedData;
}

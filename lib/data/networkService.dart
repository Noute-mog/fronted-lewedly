
 import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lewedly/data/exceptions.dart';
class NetworkService {
  final storage = FlutterSecureStorage();
  int timeout = 60;
 var BaseApi="http://192.168.241.152:8000/userauth";
 dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        String myres = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(myres);
        return responseJson;
      case 204:
        return response;
      case 205:
        return response;
      case 201:
        String myres = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(myres);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode: ${response.statusCode}',
        );
    }
  }

 Future<dynamic> login(String telephone, String? password)  async {
    dynamic responseJson;
    try {
      // print("device *****${user.device_token}");
      var response = await http
          .post(
            Uri.parse('$BaseApi/api/token/'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "phone_number":telephone,
               "password":password,
            }),
          )
          .timeout(const Duration(seconds: 60));
      print(response.statusCode);
      print(response.body);

      responseJson = _response(response);
    } on BadRequestException {
      print("bad 400");
      throw Failure();
    } on TimeoutException {
      print("timeout");
      throw Failure();
    } on SocketException catch (e) {
      print("Socket");
      throw Failure();
    } on ClientException catch (e) {
      print("ClientException ");
      throw Failure();
    } on UnauthorisedException {
      print("401-3");
      throw Failure(code: 1);
    } on NotFoundException {
      print("404");
      throw Failure();
    } on FetchDataException {
      print("FetchData");
      throw Failure(message: "Erreur fetch data:");
    }

    return responseJson;
  }


  Future<dynamic> registre(String nom,String pren, String num,String pwd) async {
    dynamic responseJson;
    try {
      print("creer client");

      var response = await http
          .post(
            Uri.parse('$BaseApi/register/'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              "first_name":nom,
              "last_name": pren,
              "phone_number":num,
              "password":pwd
            }),
          )
          .timeout(Duration(seconds: 60));
      print(response.statusCode);
      print(response.body);

      responseJson = _response(response);
    } on BadRequestException {
      print("bad 400");
      throw Failure();
    } on TimeoutException {
      print("timeout");
      throw Failure();
    } on SocketException catch (e) {
      print("Socket");
      throw Failure();
    } on ClientException catch (e) {
      print("ClientException ");
      throw Failure();
    } on UnauthorisedException {
      print("401-3");
      throw Failure(code: 1);
    } on NotFoundException {
      print("404");
      throw Failure();
    } on FetchDataException {
      print("FetchData");
      throw Failure(message: "Erreur fetch data:");
    }

    return responseJson;
  }


 Future<dynamic> creerSignalement(String nom,String age, String adresse,File image,String description) async {
    dynamic responseJson;
    try {
      
      String? token = await storage.read(key: "access");
      print(token);
           http.MultipartRequest request = http.MultipartRequest(
          'POST', Uri.parse('$BaseApi/createsSignalement/'));
          request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      request.fields['nom'] = nom;
      request.fields['adresse'] = adresse;
      request.fields['age'] = age;
      request.fields['description'] = description;
      request.files.add(await http.MultipartFile.fromPath('photo', image.path));

      var response = await http.Response.fromStream(await request.send())
          .timeout(const Duration(seconds: 120));
      responseJson = _response(response);
      print(response.statusCode);
      print(response.body);

      responseJson = _response(response);
    } on BadRequestException {
      print("bad 400");
      throw Failure();
    } on TimeoutException {
      print("timeout");
      throw Failure();
    } on SocketException catch (e) {
      print("Socket");
      throw Failure();
    } on ClientException catch (e) {
      print("ClientException ");
      throw Failure();
    } on UnauthorisedException {
      print("401-3");
      throw Failure(code: 1);
    } on NotFoundException {
      print("404");
      throw Failure();
    } on FetchDataException {
      print("FetchData");
      throw Failure(message: "Erreur fetch data:");
    }

    return responseJson;
  }



Future<dynamic> malisteSignalement() async {
   String? token = await storage.read(key: "access");
    dynamic responseJson;
    try {
      print("creer client");

      var response = await http
          .get(
            Uri.parse('$BaseApi/maListSignalement/'),
            headers: {'Content-Type': 'application/json', 'Authorization' : 'Bearer $token'},
           
          )
          .timeout(const Duration(seconds: 60));
      print(response.statusCode);
      print(response.body);

      responseJson = _response(response);
    } on BadRequestException {
      print("bad 400");
      throw Failure();
    } on TimeoutException {
      print("timeout");
      throw Failure();
    } on SocketException catch (e) {
      print("Socket");
      throw Failure();
    } on ClientException catch (e) {
      print("ClientException ");
      throw Failure();
    } on UnauthorisedException {
      print("401-3");
      throw Failure(code: 1);
    } on NotFoundException {
      print("404");
      throw Failure();
    } on FetchDataException {
      print("FetchData");
      throw Failure(message: "Erreur fetch data:");
    }

    return responseJson;
  }

Future<dynamic> touslisteSignalement() async {
  String? token = await storage.read(key: "access");
    dynamic responseJson;
    try {
      print("creer client");

      var response = await http
          .get(
            Uri.parse('$BaseApi/tousListSignalement/'),
            headers: {'Content-Type': 'application/json',
            'Authorization' : 'Bearer $token'
            },
           
          )
          .timeout(const Duration(seconds: 60));
      print(response.statusCode);
      print(response.body);

      responseJson = _response(response);
    } on BadRequestException {
      print("bad 400");
      throw Failure();
    } on TimeoutException {
      print("timeout");
      throw Failure();
    } on SocketException catch (e) {
      print("Socket");
      throw Failure();
    } on ClientException catch (e) {
      print("ClientException ");
      throw Failure();
    } on UnauthorisedException {
      print("401-3");
      throw Failure(code: 1);
    } on NotFoundException {
      print("404");
      throw Failure();
    } on FetchDataException {
      print("FetchData");
      throw Failure(message: "Erreur fetch data:");
    }

    return responseJson;
  }
 }
 
 
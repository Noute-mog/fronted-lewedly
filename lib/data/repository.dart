


import 'dart:io';

import 'package:lewedly/data/networkService.dart';

class Repository {
  final NetworkService? networkService;

  Repository({this.networkService});

 Future<dynamic> login(String telephone, String? password) async {
    final login = await networkService!.login(telephone, password);
    return login;
  }
Future<dynamic> registre(String nom,String pren, String num,String pwd) async {
    final response = await networkService!.registre( nom,  pren, num, pwd);
    return response;
  }
 Future<dynamic> creerSignalement(String nom,String age, String adresse,File image,String description) async {
    final response = await networkService!.creerSignalement( nom,  age, adresse, image,description);
    return response;
  }
}
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lewedly/data/exceptions.dart';
import 'package:lewedly/data/repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  Repository? repository;
  AuthCubit({this.repository}) : super(AuthInitial());

  
  void login(
      String telephone, String? password,  BuildContext context)async {
         final storage = FlutterSecureStorage();
     emit(AuthLoding());
    try {
      final responsejson = await repository!.login(telephone,password);

      if (responsejson['code'] == "400") {
        var erreur = responsejson['message'];
        print(erreur);
        emit(Autherror(message: erreur));
      } else {
        storage.write(key: "access", value: responsejson["access"]);
        storage.write(key: "username", value: responsejson["username"]);
        storage.write(key: "phone", value: responsejson["phone_number"]);
        storage.write(key: "email", value: responsejson["email"]);
        storage.write(key: "first_name", value: responsejson["first_name"]);
        storage.write(key: "last_name", value: responsejson["last_name"]);
        
        emit(AuthLoded(message:"bienvenue"));

      }
    } on Failure catch (e) {
      emit(Autherror(message:"veillez reassayer plus tard"
         ));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lewedly/data/exceptions.dart';
import 'package:lewedly/data/repository.dart';
import 'package:meta/meta.dart';

part 'registre_state.dart';

class RegistreCubit extends Cubit<RegistreState> {
   Repository? repository;
  RegistreCubit({this.repository}) : super(RegistreInitial());

  Future<void> registre(
     String nom,String pren, String num,String pwd, BuildContext context) async {
    try {
      emit(RegistreLoding());
      await repository!.registre( nom,  pren, num, pwd);
      emit(RegistreLoded(message: 'creer avec succès'));
    } on Failure catch (e) {
      
        emit(Registreerror(message: "Veuillez réessayer plus tard"));
      
    }
  }
}

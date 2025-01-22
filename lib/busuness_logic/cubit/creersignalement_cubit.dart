import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lewedly/data/exceptions.dart';
import 'package:lewedly/data/repository.dart';
import 'package:meta/meta.dart';

part 'creersignalement_state.dart';

class CreersignalementCubit extends Cubit<CreersignalementState> {
   Repository? repository;
  CreersignalementCubit({this.repository}) : super(CreersignalementInitial());

   Future<void> creerSignalement(String nom,String age, String adresse,File image,String description, BuildContext context) async {
    try {
      emit(CreersignalementLoding());
      await repository!.creerSignalement( nom,  age, adresse, image,description);
      emit(CreersignalementLoded(message: 'creer avec succès'));
    } on Failure catch (e) {
      
        emit(Creersignalementerror(message: "Veuillez réessayer plus tard"));
      
    }
  }
}

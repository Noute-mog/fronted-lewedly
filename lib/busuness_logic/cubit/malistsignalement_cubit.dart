import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lewedly/data/exceptions.dart';
import 'package:lewedly/data/model/signalement.dart';
import 'package:lewedly/data/repository.dart';
import 'package:meta/meta.dart';

part 'malistsignalement_state.dart';

class MalistsignalementCubit extends Cubit<MalistsignalementState> {
   Repository? repository;
  MalistsignalementCubit({this.repository}) : super(MalistsignalementInitial());

   Future<void> Malistsignalement( BuildContext context) async {
    try {
      emit(MalistsignalementLoding());
      List<Signalement> listSignalement=await repository!.malisteSignalement();
      emit(MalistsignalementLoded(listsignalement:listSignalement ));
    } on Failure catch (e) {
      
        emit(Malistsignalementerror(message: "Veuillez réessayer plus tard"));
      
    }
}
}
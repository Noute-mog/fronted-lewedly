import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lewedly/data/exceptions.dart';
import 'package:lewedly/data/model/signalement.dart';
import 'package:lewedly/data/repository.dart';
import 'package:meta/meta.dart';

part 'touslistsignalement_state.dart';

class TouslistsignalementCubit extends Cubit<TouslistsignalementState> {
  Repository? repository;
  TouslistsignalementCubit({this.repository})
      : super(TouslistsignalementInitial());

  Future<void> touslistsignalement(BuildContext context) async {
    try {
      emit(TouslistsignalementLoding());
      List<Signalement> listSignalement =
          await repository!.touslisteSignalement();
      emit(TouslistsignalementLoded(listsignalement: listSignalement));
    } on Failure catch (e) {
      emit(Touslistsignalementerror(message: "Veuillez réessayer plus tard"));
    }
  }
}

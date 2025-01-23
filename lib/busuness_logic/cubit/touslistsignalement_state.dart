part of 'touslistsignalement_cubit.dart';

@immutable
abstract class TouslistsignalementState {}

 class TouslistsignalementInitial extends TouslistsignalementState {}



 class TouslistsignalementLoding extends TouslistsignalementState {}

class TouslistsignalementLoded extends TouslistsignalementState {
  final List<Signalement>  listsignalement;
  TouslistsignalementLoded({required this.listsignalement});
}

class Touslistsignalementerror extends TouslistsignalementState {
  final String message;
  Touslistsignalementerror({required this.message});
}

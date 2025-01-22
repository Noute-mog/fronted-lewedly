part of 'creersignalement_cubit.dart';

@immutable
abstract class CreersignalementState {}

 class CreersignalementInitial extends CreersignalementState {}

 class CreersignalementLoding extends CreersignalementState {}

class CreersignalementLoded extends CreersignalementState {
  final String message;
  CreersignalementLoded({required this.message});
}

class Creersignalementerror extends CreersignalementState {
  final String message;
  Creersignalementerror({required this.message});
}

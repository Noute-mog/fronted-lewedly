part of 'registre_cubit.dart';

@immutable
abstract class RegistreState {}

class RegistreInitial extends RegistreState {}

class RegistreLoding extends RegistreState {}

class RegistreLoded extends RegistreState {
  final String message;
  RegistreLoded({required this.message});
}

class Registreerror extends RegistreState {
  final String message;
  Registreerror({required this.message});
}

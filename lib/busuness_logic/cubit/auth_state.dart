part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoding extends AuthState {}
 class AuthLoded extends AuthState {
  final String message;
  AuthLoded({required this.message});
 }

  class Autherror extends AuthState {
    final String message;
  Autherror({required this.message});
  }
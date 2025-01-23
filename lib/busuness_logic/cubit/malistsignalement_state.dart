part of 'malistsignalement_cubit.dart';

@immutable
abstract class MalistsignalementState {}

 class MalistsignalementInitial extends MalistsignalementState {}

 class MalistsignalementLoding extends MalistsignalementState {}

class MalistsignalementLoded extends MalistsignalementState {
  final List<Signalement>  listsignalement;
  MalistsignalementLoded({required this.listsignalement});
}

class Malistsignalementerror extends MalistsignalementState {
  final String message;
  Malistsignalementerror({required this.message});
}

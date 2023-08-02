// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoaded extends CharacterState {
  List<Character> characterlist;
  CharacterLoaded({
    required this.characterlist,
  });
}

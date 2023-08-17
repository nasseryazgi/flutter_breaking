import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/data/models/character/character.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.characterRepoitory) : super(CharacterInitial());

  final CharacterRepoitory characterRepoitory;
  List<Character> character = [];
  List<Character> getAllCharacters() {
    characterRepoitory.getCharacters().then((characters) {
      emit(CharacterLoaded(characterlist: characters));
      character = characters;
    });
    return character;
  }
}

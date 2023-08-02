import 'package:flutter_breaking/data/models/character/character.dart';
import 'package:flutter_breaking/data/models/character/characterslist.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';

class CharacterRepoitory {
  CharacterRepoitory({required this.characterWebServies});
  final CharacterWebServies characterWebServies;
  late List<Character> characters;
  Future<List<Character>> getCharacters() async {
    final characters = await characterWebServies.getAllCharacterWebServices();
    CharactersList characterss = CharactersList.fromJson(characters);
    List<Character> charactersList =
        characterss.characterslist.map((e) => Character.fromJson(e)).toList();
    return charactersList;
  }
}

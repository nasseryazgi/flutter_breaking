class CharactersList {
  List<dynamic> characterslist;
  CharactersList({required this.characterslist});
  factory CharactersList.fromJson(Map<String, dynamic> josnData) {
    return CharactersList(
      characterslist: josnData['results'],
    );
  }
}

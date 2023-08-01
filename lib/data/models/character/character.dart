
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? gender;
  String? image;
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image,

  });
  factory Character.fromJson(Map<String, dynamic> json) =>
      Character(
        id: json['id'] as int?,
        name: json['name'] as String?,
        status: json['status'] as String?,
        species: json['species'] as String?,
        gender: json['gender'] as String?,
        image: json['image'] as String?,

      );

}
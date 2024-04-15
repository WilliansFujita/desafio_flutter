class HeroDTO {
  int id;
  String name;
  String photoPath;
  String description;

  HeroDTO(this.id, this.name, this.photoPath, this.description);

  static List<HeroDTO> fromJsonList(json) {
    List<HeroDTO> heroes = [];

    for (final {
          "id": id as int,
          "name": name as String,
          "thumbnail": thumbnail as Map<String, dynamic>,
          "description": description as String
        } in json) {

      var path = thumbnail["path"];    
      var extension = thumbnail["extension"];    
      var hero = HeroDTO(id, name, '$path.$extension', description);
      heroes.add(hero);
    }

    return heroes;
  }
}

class City {
  int id;
  dynamic parentId;
  dynamic left;
  dynamic right;
  int depth;
  String name;
  String alternames;
  String country;
  String a1Code;
  String level;
  int population;
  String lat;
  String long;
  String timezone;

  City({
    required this.id,
    required this.parentId,
    required this.left,
    required this.right,
    required this.depth,
    required this.name,
    required this.alternames,
    required this.country,
    required this.a1Code,
    required this.level,
    required this.population,
    required this.lat,
    required this.long,
    required this.timezone,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        parentId: json["parent_id"],
        left: json["left"],
        right: json["right"],
        depth: json["depth"],
        name: json["name"],
        alternames: json["alternames"],
        country: json["country"],
        a1Code: json["a1code"],
        level: json["level"],
        population: json["population"],
        lat: json["lat"],
        long: json["long"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "left": left,
        "right": right,
        "depth": depth,
        "name": name,
        "alternames": alternames,
        "country": country,
        "a1code": a1Code,
        "level": level,
        "population": population,
        "lat": lat,
        "long": long,
        "timezone": timezone,
      };
}

class CardFormDetails {
  String name;
  List<String> abilities;
  List<String> headres;
  String bgcolor;
  String picture;
  List<dynamic> moves;
  List<dynamic> evolution;
  List<dynamic> baseStats;
  PokemonAbout about;

  CardFormDetails({
    required this.name,
    required this.headres,
    required this.abilities,
    required this.bgcolor,
    required this.picture,
    required this.about,
    required this.moves,
    required this.baseStats,
    required this.evolution,
  });

  
  factory CardFormDetails.fromJson(Map<String, dynamic> json) =>
  CardFormDetails(
    name: json['name'],
    headres: json.keys.toList(),
    abilities: (json['abilities'] as List)
    .map((e)=>e['ability']['name'] as String).toList(),
    bgcolor: json['types'][0]['type']['name'],
    picture: json['sprites']['other']['home']['front_default'].toString(),
    about: PokemonAbout.fromData(json),
    baseStats: ["Ikki", "Ikki"],
    moves: ["dadas"],
    evolution: ["shhsda", "dasdsdas"],
  );

}

class PokemonAbout{  
  int baseExp;
  int height;
  int order;
  int weight;

  PokemonAbout({
    required this.baseExp,
    required this.height,
    required this.order,
    required this.weight,
  });

  factory PokemonAbout.fromData(Map<String, dynamic> data) => 
  PokemonAbout(
    baseExp: data['base_experience'], 
    height: data['height'], 
    order: data['order'], 
    weight: data['weight']);

}
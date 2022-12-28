import 'package:http/http.dart' as http;

import '../model/pokemon.dart';

class PokemonApiServices {
  static Future<PokemonModel?> getpokemondata() async {
    http.Response response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"));
    if (response.statusCode == 200) {
      return pokemonModelFromJson(response.body);
    } else {
      return null;
    }
  }
}

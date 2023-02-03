import 'dart:convert';
import 'package:kawin101api/pokemon_list_model.dart';
import 'package:http/http.dart' as http;

class PokemonProvider {
  Future<PokemonListModel> getPokemonList() async {
    // var uri = Uri.https('pokeapi.co', 'api/v2/pokemon');
    var uri = Uri.https('pokeapi.co', 'api/v2/pokemon');
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PokemonListModel pModel = PokemonListModel.fromJSON(body);
      return pModel;
    } else {
      print("Can't get response from server");
      throw "Server exception";
    }
  }
}

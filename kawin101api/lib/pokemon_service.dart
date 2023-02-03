import 'package:kawin101api/pokemon_list_model.dart';
import 'package:kawin101api/pokemon_provider.dart';

class PokemonService {
  PokemonProvider _pokemonProvider = PokemonProvider();

  Future<PokemonListModel> getPokemonList() async {
    return _pokemonProvider.getPokemonList();
  }
}

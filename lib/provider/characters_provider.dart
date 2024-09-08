import 'package:flutter/material.dart';
import 'package:rickandmorty/data/characters_web_services.dart';

class CharactersProvider with ChangeNotifier {
  List<dynamic> _characters = [];
  bool _isLoading = false;

  List<dynamic> get characters => _characters;
  bool get isLoading => _isLoading;

  CharactersProvider() {
    fetchCharacters(); // Fetch characters when the provider is initialized
  }

  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners to update the UI

    try {
      CharactersWebServices charactersWebServices = CharactersWebServices();
      _characters = await charactersWebServices.getAllCharacters();
    } catch (e) {
      print('Error fetching characters: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners to update the UI after fetching
    }
  }
}

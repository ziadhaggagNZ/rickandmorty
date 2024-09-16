import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rickandmorty/data/characters_web_services.dart';

class CharactersProvider with ChangeNotifier {
  List<dynamic> _characters = [];
  bool _isLoading = false;
  int _pageNumber = 1; 
  List<Map<String, String>> _favorite = []; 

  List<dynamic> get characters => _characters;
  bool get isLoading => _isLoading;
  int get pageNumber => _pageNumber; 
  List<Map<String, String>> get favorite => _favorite;

  CharactersProvider() {
    getCharacters();
    loadFavorites();
  }

  Future<void> getCharacters() async {
    _isLoading = true;
    notifyListeners();

    try {
      CharactersWebServices charactersWebServices = CharactersWebServices();
      _characters = await charactersWebServices.getAllCharacters(_pageNumber);
    } catch (e) {
      print('Error: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  void nextPage() {
    if (_pageNumber < 41) {
      _pageNumber++;
      getCharacters();
      print(_pageNumber);
    }
  }

  void previousPage() {
    if (_pageNumber > 1) {
      _pageNumber--;
      getCharacters();
      print(_pageNumber);
    }
  }

  Future<void> addToFavoriteList(
      String name, String image, String status, String species, String gender) async {
    _favorite.add({
      'Name': name,
      'Image': image,
      'Status': status,
      'Species': species,
      'Gender': gender,
    });
    print("addedddddddddddddddddddddddddd"); //! to test
    print(_favorite); //! to test
    await saveFavorites();
    notifyListeners();
  }

  Future<void> deleteFromFavoriteList(String name) async {
    _favorite.removeWhere((item) => item['Name'] == name);
    print("removeddddddddddddddddddddddd"); //! to test
    print(_favorite); //! to test
    await saveFavorites();
    notifyListeners();
  }

  bool searchFromFavoriteList(String name) {
    return _favorite.any((item) => item['Name'] == name);
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favoritesJson = jsonEncode(_favorite);
    await prefs.setString('favorite_list', favoritesJson);
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favoritesJson = prefs.getString('favorite_list');
    if (favoritesJson != null) {
      List<dynamic> favoritesList = jsonDecode(favoritesJson);
      _favorite = List<Map<String, String>>.from(favoritesList.map((item) => Map<String, String>.from(item)));
    }
    notifyListeners();
  }

  bool isEmpty()
  {
    return _favorite.isEmpty;
  }

  addCharacter(Map<String, String> map) {}

}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rickandmorty/data/characters_web_services.dart';

// Characters Provider class
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
    GetCharacters();
    LoadFavorites();
  }

  // get Characters 
  Future<void> GetCharacters() async {
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
  
  // Go to next page
  void NextPage() {
    if (_pageNumber < 42) {
      _pageNumber++;
      GetCharacters();
    }
  }


  // Go to previous page
  void PreviousPage() {
    if (_pageNumber > 1) {
      _pageNumber--;
      GetCharacters();
    }
  }


  // add To Favorite List
  Future<void> AddToFavoriteList(
      String name, String image, String status, String species, String gender) async {
    _favorite.add({
      'Name': name,
      'Image': image,
      'Status': status,
      'Species': species,
      'Gender': gender,
    });
    await SaveFavorites();
    notifyListeners();
  }


  // Delete From Favorite List
  Future<void> DeleteFromFavoriteList(String name) async {
    _favorite.removeWhere((item) => item['Name'] == name);
    await SaveFavorites();
    notifyListeners();
  }


  //Search From Favorite List
  bool SearchFromFavoriteList(String name) {
    return _favorite.any((item) => item['Name'] == name);
  }

  // Save Favorites
  Future<void> SaveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favoritesJson = jsonEncode(_favorite);
    await prefs.setString('favorite_list', favoritesJson);
  }


  
  // Load Favorites list
  Future<void> LoadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favoritesJson = prefs.getString('favorite_list');
    if (favoritesJson != null) {
      List<dynamic> favoritesList = jsonDecode(favoritesJson);
      _favorite = List<Map<String, String>>.from(favoritesList.map((item) => Map<String, String>.from(item)));
    }
    notifyListeners();
  }

  // favorite list  is Empty
  bool IsEmpty()
  {
    return _favorite.isEmpty;
  }

  

}

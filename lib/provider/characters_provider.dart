import 'package:flutter/material.dart';
import 'package:rickandmorty/data/characters_web_services.dart';

class CharactersProvider with ChangeNotifier {
  List<dynamic> _characters = [];
  bool _isLoading = false;
  int _Page_Number = 1;

  List<dynamic> get characters => _characters;
  bool get isLoading => _isLoading;
  int get Page_Number => _Page_Number;

  CharactersProvider() {
    getCharacters(); 
    next_page();
    pre_page();
  }

  Future<void> getCharacters() async {
    _isLoading = true;
    notifyListeners(); 

    try {
      CharactersWebServices charactersWebServices = CharactersWebServices();
      _characters = await charactersWebServices.getAllCharacters(_Page_Number);
    } catch (e) {
      print('Error : $e');
     }// finally {
      // _isLoading = false;
      // notifyListeners(); 
    // }
          _isLoading = false;
      notifyListeners(); 
  }

  void next_page()
  {
    _Page_Number++;
    getCharacters();
    notifyListeners();
    
    print(_Page_Number); 
  }
   void pre_page()
  {
    _Page_Number--;
    notifyListeners();
    getCharacters(); 
    print(_Page_Number); 

    
  }
}

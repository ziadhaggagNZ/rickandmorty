import 'package:flutter/material.dart';
import 'package:rickandmorty/data/characters_web_services.dart';

class CharactersProvider with ChangeNotifier {
  List<dynamic> _characters = [];
  bool _isLoading = false;
  int _pageNumber = 1; // Renamed to follow Dart conventions
  List<Map<String, String>> _favorite = []; // Changed to private

  List<dynamic> get characters => _characters;
  bool get isLoading => _isLoading;
  int get pageNumber => _pageNumber; // Renamed to follow Dart conventions
  List<Map<String, String>> get favorite => _favorite;

  CharactersProvider() {
    getCharacters();
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

  void addToFavoriteList(
      String name, String image, String status, String species, String gender) {
    _favorite.add({
      'Name': name,
      'Image': image,
      'Status': status,
      'Species': species,
      'Gender': gender,
    });
    print("addedddddddddddddddddddddddddd"); //! to test
    print(_favorite); //! to test
    notifyListeners();
  }

  void deleteFromFavoriteList(String name) {
    _favorite.removeWhere((item) => item['Name'] == name);
    print("removeddddddddddddddddddddddd"); //! to test
    print(_favorite); //! to test
    notifyListeners();
  }

  bool searchFromFavoriteList(String name) {
    if (_favorite.any((item) => item['Name'] == name)) {
      //notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:rickandmorty/data/characters_web_services.dart';

// class CharactersProvider with ChangeNotifier {
//   List<dynamic> _characters = [];
//   bool _isLoading = false;
//   int _Page_Number = 1;

//   List<dynamic> get characters => _characters;
//   bool get isLoading => _isLoading;
//   int get Page_Number => _Page_Number;
//   CharactersProvider() {
//     getCharacters();
//   }

//   Future<void> getCharacters() async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       CharactersWebServices charactersWebServices = CharactersWebServices();
//       _characters = await charactersWebServices.getAllCharacters(_Page_Number);
//     } catch (e) {
//       print('Error : $e');
//     }
//     _isLoading = false;
//     notifyListeners();
//   }

//   void next_page() {
//     if (_Page_Number < 41) {
//       _Page_Number++;
//       getCharacters();
//       notifyListeners();
//       print(_Page_Number);
//     }
//   }

//   void pre_page() {
//     if (_Page_Number > 1) {
//       _Page_Number--;
//       notifyListeners();
//       getCharacters();
//       print(_Page_Number);
//     }
//   }
  
//   List<Map<String,String>> Favorite =[];

//  void Add_TO_FavoriteList(String name, String image, String status, String species, String gender) {
//     Favorite.add({
//       'Name': name,
//       'Image': image,
//       'Status': status,
//       'Species': species,
//       'Gender': gender,
//     });
//     print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzz"); //! to test
//     print(Favorite); //! to test
//   }
// }

// void Delete_FROM_FavoriteList(String name)
// {
//   void deleteFromFavoriteList(String name) {
//   _favorite.removeWhere((item) => item['Name'] == name);
//   notifyListeners(); // Notify listeners to update the UI when favorite list changes
// }

// }


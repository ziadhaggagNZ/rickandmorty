import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late CharactersProvider charactersProvider;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    charactersProvider = CharactersProvider();
  });

  test('Initial character list is empty', () {
    expect(charactersProvider.characters, []);
  });

  test('Add character to favorite list', () async {
    await charactersProvider.AddToFavoriteList('Rick', 'image_url', 'Alive', 'Human', 'Male');
    expect(charactersProvider.favorite.length, 1);
    expect(charactersProvider.favorite[0]['Name'], 'Rick');
  });

  test('Remove character from favorite list', () async {
    await charactersProvider.AddToFavoriteList('Rick', 'image_url', 'Alive', 'Human', 'Male');
    await charactersProvider.DeleteFromFavoriteList('Rick');
    expect(charactersProvider.favorite.length, 0);
  });

  test('Search for a character in the favorite list', () async {
    await charactersProvider.AddToFavoriteList('Rick', 'image_url', 'Alive', 'Human', 'Male');
    bool isFavorite = charactersProvider.SearchFromFavoriteList('Rick');
    expect(isFavorite, true);

    bool isNotFavorite = charactersProvider.SearchFromFavoriteList('Morty');
    expect(isNotFavorite, false);
  });

  test('Load favorites from SharedPreferences', () async {
    await charactersProvider.AddToFavoriteList('Rick', 'image_url', 'Alive', 'Human', 'Male');

    CharactersProvider newProvider = CharactersProvider();
    await newProvider.LoadFavorites();
    expect(newProvider.favorite.length, 1);
    expect(newProvider.favorite[0]['Name'], 'Rick');
  });

  test('Page number increments and decrements correctly', () {
    expect(charactersProvider.pageNumber, 1);

    charactersProvider.NextPage();
    expect(charactersProvider.pageNumber, 2);

    charactersProvider.PreviousPage();
    expect(charactersProvider.pageNumber, 1);
  });
}








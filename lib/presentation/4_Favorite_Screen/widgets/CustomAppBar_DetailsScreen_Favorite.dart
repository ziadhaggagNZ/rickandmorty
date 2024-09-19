import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/Movie_List_Screen.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/Favorite_Screen.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';

// custom AppBar in Favorite Screen 
AppBar customAppBarDetailsScreenFavorite(
    BuildContext context, favoriteCharacter) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Text(
              favoriteCharacter["Name"] ?? "Unknown",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Consumer<CharactersProvider>(
          builder: (context, provider, child) {
            bool isFavorite = provider
                .SearchFromFavoriteList(favoriteCharacter["Name"] ?? "Unknown");
            return IconButton(
              onPressed: () {
                if (isFavorite) {
                  provider.DeleteFromFavoriteList(
                      favoriteCharacter["Name"] ?? "Unknown");
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MovieListScreen()),
                    (Route<dynamic> route) => false,
                  );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FavoriteScreen(provider: provider),
                  ));
                } else {
                  provider.AddToFavoriteList(
                    favoriteCharacter["Name"] ?? "Unknown",
                    favoriteCharacter["Image"] ?? "Unknown",
                    favoriteCharacter["Status"] ?? "Unknown",
                    favoriteCharacter["Species"] ?? "Unknown",
                    favoriteCharacter["gender"] ?? "Unknown",
                  );
                }
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite_outlined, color: Colors.red)
                  : const Icon(Icons.favorite_outline_sharp),
            );
          },
        ),
      ],
    ),
  );
}


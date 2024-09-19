import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';

// Custom AppBar in details screen
AppBar CustomAppBarDetailsScreen(BuildContext context,  character) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Text(
              character["name"] ?? "Unknown",
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
            bool isFavorite = provider.SearchFromFavoriteList(character["name"] ?? "Unknown");
            return IconButton(
              onPressed: () {
                if (isFavorite) {
                  provider.DeleteFromFavoriteList(character["name"] ?? "Unknown");
                } else {
                  provider.AddToFavoriteList(
                    character["name"] ?? "Unknown",
                    character["image"] ?? "Unknown",
                    character["status"] ?? "Unknown",
                    character["species"] ?? "Unknown",
                    character["gender"] ?? "Unknown",
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


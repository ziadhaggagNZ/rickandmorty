import 'package:flutter/material.dart';
import 'package:rickandmorty/provider/characters_provider.dart';

GridView CharactersBuilder(CharactersProvider provider) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: provider.characters.length,
    itemBuilder: (context, index) {
      final character = provider.characters[index];
      return GridTile(
        footer: Container(
          padding: const EdgeInsets.all(4.0),
          color: Colors.black54,
          child: Text(
            character["name"] ?? "Unknown",
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: FadeInImage.assetNetwork(
          height: double.infinity,
          width: double.infinity,
          placeholder: "assets/Loading4.gif", 
          image: character["image"] ?? "",
          fit: BoxFit.cover,
        ),
      );
    },
  );
}

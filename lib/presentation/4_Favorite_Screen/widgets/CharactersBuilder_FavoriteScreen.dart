import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/Details_Favorite_Screen.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';
import 'package:animations/animations.dart';

//GridView builder widget in Favorite screen
GridView CharactersBuilder_FavoriteScreen(CharactersProvider provider) {
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
    itemCount: provider.favorite.length,
    itemBuilder: (context, index) {
      final Favorite_Character = provider.favorite[index];
      //final name = Favorite_Character["Name"];
      return OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        transitionDuration: const Duration(milliseconds: 500),
        closedBuilder: (context, action) => InkWell(
          onTap: action,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4),
            ),
            child: GridTile(
              footer: Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.black54,
                child: Text(
                  Favorite_Character["Name"] ?? "Unknown",
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
                image: Favorite_Character["Image"] ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        openBuilder: (context, action) => DetailsFavoriteScreen(
          provider: provider,
          index: index,
        ),
      );
    },
  );
}


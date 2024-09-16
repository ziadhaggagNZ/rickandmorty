import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/Details_Screen.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:rickandmorty/provider/characters_provider.dart';
import 'package:animations/animations.dart';

GridView CharactersBuilder(
    CharactersProvider provider, AutoScrollController scrollController) {
  return GridView.builder(
    controller: scrollController,
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
      final isFavorite = provider.searchFromFavoriteList(character["name"] ?? "Unknown");

      return AutoScrollTag(
        key: ValueKey(index),
        controller: scrollController,
        index: index,
        child: OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          transitionDuration: const Duration(milliseconds: 300),  
          closedBuilder: (context, action) => InkWell(
            onTap: action,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                   child: GridTile(
                     child: FadeInImage.assetNetwork(
                      height: double.infinity,
                      width: double.infinity,
                      placeholder: "assets/Loading4.gif",
                      image: character["image"] ?? "",
                      fit: BoxFit.cover,
                    ),
                    footer: Container(
                      padding: const EdgeInsets.all(4.0),
                      color: Colors.black54,
                      child: Center(
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
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,  
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      if (isFavorite) {
                        provider.deleteFromFavoriteList(character["name"] ?? "Unknown");
                      } else {
                        provider.addToFavoriteList(
                          character["name"] ?? "Unknown",
                          character["image"] ?? "Unknown",
                          character["status"] ?? "Unknown",
                          character["species"] ?? "Unknown",
                          character["gender"] ?? "Unknown",
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          openBuilder: (context, action) => DetailsScreen(
            provider: provider,
            index: index,
          ),
        ),
      );
    },
  );
}

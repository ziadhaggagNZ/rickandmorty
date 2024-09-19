  import 'package:flutter/material.dart';
//Character Image in Favorite screen
Container Character_Image_Favorite(BuildContext context, favoriteCharacter) {
    return Container(
            margin: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: FadeInImage.assetNetwork(
              height: double.infinity,
              width: double.infinity,
              placeholder: "assets/Loading4.gif",
              image: favoriteCharacter["Image"] ?? "",
              fit: BoxFit.cover,
            ),
          );
  }
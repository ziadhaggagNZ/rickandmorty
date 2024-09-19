  import 'package:flutter/material.dart';

// Character Image in details screen
Container Character_Image(BuildContext context, character) {
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
              image: character["image"] ?? "",
              fit: BoxFit.cover,
            ),
          );
  }
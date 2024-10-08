import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/Favorite_Screen.dart';
// AppBar widget in movie list screen
AppBar CustomAppBar(context,provider) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5,left: 50),
          height: 65,
          width: 80,
          child: Image.asset("assets/RickandMorty_logo.jpg", fit: BoxFit.contain),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    actions: [
      IconButton(onPressed: () { 
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteScreen(provider: provider,)));
      },
       icon: const Icon(Icons.favorite),iconSize: 30,color: Colors.red,)
    ],
  );
}
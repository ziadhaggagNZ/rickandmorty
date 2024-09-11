import 'package:flutter/material.dart';

AppBar CustomAppBar_FavoriteScreen() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5,right: 50),
          height: 65,
          width: 80,
          child: Image.asset("assets/RickandMorty_logo.jpg", fit: BoxFit.contain),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    
  );
}
import 'package:flutter/material.dart';

// App Bar widget in offline screen
AppBar CustomAppBar_offline() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5,),
          height: 65,
          width: 80,
          child: Image.asset("assets/RickandMorty_logo.jpg", fit: BoxFit.contain),
        ),
      ],
    ),
    backgroundColor: Colors.white,

  );
}
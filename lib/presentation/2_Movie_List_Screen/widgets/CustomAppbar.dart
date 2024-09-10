import 'package:flutter/material.dart';

AppBar CustomAppBar() {
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
        //!\\\\\\\\\\\  
      },
       icon: const Icon(Icons.favorite),iconSize: 30,color: Colors.red,)
    ],
  );
}
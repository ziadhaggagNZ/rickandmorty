 import 'package:flutter/material.dart';

AppBar Custom_AppBar_Details_screen(character) {
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
          IconButton(
            onPressed: () {
              //!\\\\\\\\\\\
            },
            icon: const Icon(Icons.favorite_outline_sharp),
          ),
        ],
      ),
    );
  }
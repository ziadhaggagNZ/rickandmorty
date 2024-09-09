 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/provider/characters_provider.dart';

Widget Custtom_Nav_Bar(BuildContext context) {
  final charactersProvider = Provider.of<CharactersProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        color:  Color.fromARGB(255, 219, 216, 216),
    
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(), 
        notchMargin: 18, 
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_circle_left_outlined, color: Colors.black ,size: 40,),
              onPressed: () {
               //context.read<CharactersProvider>().pre_page();
               charactersProvider.pre_page();

              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_circle_right_outlined, color: Colors.black ,size: 40,),
              onPressed: () {
                //context.read<CharactersProvider>().next_page();
                charactersProvider.next_page();

              },
            ),
          ],
        ),
      ),
    );
  }
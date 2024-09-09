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
        notchMargin: 25, 
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_circle_left_outlined, color: Colors.black ,size: 50,),
              onPressed: () {
               if(charactersProvider.Page_Number == 1)
               {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No pre pages"),duration: Duration(seconds: 1),));
               }
               else
               {
                charactersProvider.pre_page(); 
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pages : ${charactersProvider.Page_Number} of 42 "),duration: Duration(seconds: 1),));
               }
              },
            ),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_circle_right_outlined, color: Colors.black ,size: 50,),
              onPressed: () {
                  if(charactersProvider.Page_Number == 42)
               {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No next pages"),duration: Duration(seconds: 1),));
               }
               else
               {
                charactersProvider.next_page(); 
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pages : ${charactersProvider.Page_Number} of 42 "),duration: Duration(seconds: 1),));
               }

              },
            ),
          ],
        ),
      ),
    );
  }
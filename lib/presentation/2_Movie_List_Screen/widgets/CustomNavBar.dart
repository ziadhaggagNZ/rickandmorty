 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';
// Bottom AppBar widget in movie list screen
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
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_circle_left_outlined, color: Colors.black ,size: 50,),
              onPressed: () {
               if(charactersProvider.pageNumber == 1)
               {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No pre pages"),duration: Duration(seconds: 1),));
               }
               else
               {
                charactersProvider.PreviousPage(); 
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pages : ${charactersProvider.pageNumber} of 42 "),duration: Duration(seconds: 1),));
               }
              },
            ),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_circle_right_outlined, color: Colors.black ,size: 50,),
              onPressed: () {
                  if(charactersProvider.pageNumber == 42)
               {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No next pages"),duration: Duration(seconds: 1),));
               }
               else
               {
                charactersProvider.NextPage(); 
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pages : ${charactersProvider.pageNumber} of 42 "),duration: Duration(seconds: 1),));
               }

              },
            ),
          ],
        ),
      ),
    );
  }
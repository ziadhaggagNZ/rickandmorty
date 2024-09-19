import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/CharactersBuilder_FavoriteScreen.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/CustomAppBar_FavoriteScreen.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';

// Favorite Screen class 
class FavoriteScreen extends StatefulWidget {
    final CharactersProvider provider;

const FavoriteScreen({super.key, required this.provider});
  @override
  State<FavoriteScreen> createState() => MyWidgetState();
}

class MyWidgetState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar_FavoriteScreen(),
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child:Column(
          children: [
            const SizedBox(height: 20,),
            const Center(child: Text("Favorites",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
            widget.provider.favorite.isEmpty ? 
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 250,
              width: 250,
              child: Image.asset("assets/Empty.gif",fit: BoxFit.fill,))
            :
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20,bottom: 10),
              child: CharactersBuilder_FavoriteScreen(widget.provider)
              ),
          ],
        ) ,
      ),
    );
  }
}
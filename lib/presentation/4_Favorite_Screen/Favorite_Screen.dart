import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/CharactersBuilder_FavoriteScreen.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/CustomAppBar_FavoriteScreen.dart';
import 'package:rickandmorty/provider/characters_provider.dart';

class FavoriteScreen extends StatefulWidget {
    final CharactersProvider provider;
  //   final int index;
  // const FavoriteScreen({super.key, required this.index, required this.provider});
const FavoriteScreen({super.key, required this.provider});
  @override
  State<FavoriteScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar_FavoriteScreen(),
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child:CharactersBuilder_FavoriteScreen(widget.provider) ,
      ),
    );
  }
}
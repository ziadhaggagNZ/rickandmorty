import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_Image.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_data.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/CustomAppBar_DetailsScreen.dart';
import 'package:rickandmorty/provider/characters_provider.dart';

class DetailsScreen extends StatelessWidget {
  final CharactersProvider provider;
  final int index;

  const DetailsScreen({super.key, required this.provider, required this.index});

  @override
  Widget build(BuildContext context) {
    final character = provider.characters[index];
    return Scaffold(
        appBar: Custom_AppBar_Details_screen(character),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Character_Image(context, character),
              const SizedBox(height: 40,),
              Character_data_NameStatus(character),
              Character_data_SpeciesGender(character),
              LogoDesign(),
            ],
          ),
        ));
  }





 
}

import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/Character_Image._Facorite.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/Character_data_Favorite.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/CustomAppBar_DetailsScreen_Favorite.dart';
import 'package:rickandmorty/provider/characters_provider.dart';

class DetailsFavoriteScreen extends StatelessWidget {
  final CharactersProvider provider;
  final int index;

  const DetailsFavoriteScreen({
    super.key, 
    required this.provider, 
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    // Retrieve the favorite character by index
    final favoriteCharacter = provider.favorite[index];

    // Log details for debugging
    print('Index: $index');
    print('Character Name: ${favoriteCharacter["Name"]}');

    return Scaffold(
      appBar: customAppBarDetailsScreenFavorite(context, favoriteCharacter),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Character_Image_Favorite(context, favoriteCharacter),
             const SizedBox(height: 40),
             Character_data_NameStatus_Favorite(favoriteCharacter),
             Character_data_SpeciesGender_Favorite(favoriteCharacter),
             LogoDesign(),
          ],
        ),
      ),
    );
  }
}



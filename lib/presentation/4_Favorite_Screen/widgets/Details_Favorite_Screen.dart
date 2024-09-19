import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/Character_Image._Facorite.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/Character_data_Favorite.dart';
import 'package:rickandmorty/presentation/4_Favorite_Screen/widgets/CustomAppBar_DetailsScreen_Favorite.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';

// Details Favorite Screen class
class DetailsFavoriteScreen extends StatefulWidget {
  final CharactersProvider provider;
  final int index;

  const DetailsFavoriteScreen({
    Key? key,
    required this.provider,
    required this.index,
  }) : super(key: key);

  @override
  DetailsFavoriteScreenState createState() => DetailsFavoriteScreenState();
}

class DetailsFavoriteScreenState extends State<DetailsFavoriteScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

// custom App Bar widget in  Favorite Screen
  @override
  Widget build(BuildContext context) {
    final favoriteCharacter = widget.provider.favorite[widget.index];

    return Scaffold(
      appBar: customAppBarDetailsScreenFavorite(context, favoriteCharacter),
      body: Stack(
        children: [
          _isLoading
              ? Center(
                  child: Image.asset("assets/Loading.gif"),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Character_Image_Favorite(context, favoriteCharacter),
                      const SizedBox(height: 40),
                      Character_data_NameStatus_Favorite(favoriteCharacter),
                      Character_data_SpeciesGender_Favorite(favoriteCharacter),
                      const SizedBox(height: 20),
                      LogoDesign(),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}




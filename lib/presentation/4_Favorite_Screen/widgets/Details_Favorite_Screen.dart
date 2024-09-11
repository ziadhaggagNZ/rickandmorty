
import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_Image.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_data.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/CustomAppBar_DetailsScreen.dart';
import 'package:rickandmorty/provider/characters_provider.dart';

class DetailsFavoriteScreen extends StatelessWidget {
  final CharactersProvider provider;
  final int index;

  const DetailsFavoriteScreen({super.key, required this.provider, required this.index});

  @override
  Widget build(BuildContext context) {
    final character = provider.favorite[index];
    return Scaffold(
        appBar: customAppBarDetailsScreen(context,character),
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






// import 'package:flutter/material.dart';
// import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_Image.dart';
// import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_data.dart';
// import 'package:rickandmorty/presentation/3_Details_Screen/widgets/CustomAppBar_DetailsScreen.dart';
// import 'package:rickandmorty/provider/characters_provider.dart';

// class DetailsFavoriteScreen extends StatelessWidget {
//   final CharactersProvider provider;
//   final int index;

//   const DetailsFavoriteScreen({super.key, required this.provider, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     final character = provider.characters[index];
//     return Scaffold(
//         appBar: customAppBarDetailsScreen(context,character),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Character_Image(context, character),
//               const SizedBox(height: 40,),
//               Character_data_NameStatus(character),
//               Character_data_SpeciesGender(character),
//               LogoDesign(),
//             ],
//           ),
//         ));
//   }





 
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomAppbar.dart';
import 'package:rickandmorty/provider/characters_provider.dart'; 

class MovieListScreen extends StatelessWidget {
  MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: Consumer<CharactersProvider>(
        builder: (context, provider, child) {
          // Show loading indicator while fetching data
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show message if no characters are found
          if (provider.characters.isEmpty) {
            return const Center(child: Text('No characters found'));
          }

          // Display the characters using GridView
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: provider.characters.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  children: [
                    Text(provider.characters[index]["id"].toString()), // Display character ID
                    Text(provider.characters[index]["name"]), // Display character name
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomAppbar.dart';

// class MovieListScreen extends StatefulWidget {
//    MovieListScreen({super.key});
//   @override
//   State<MovieListScreen> createState() => _MovieListScreenState();
// }

// class _MovieListScreenState extends State<MovieListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> characters = Provider.of<List<dynamic>>(context);

//     //final characters = Provider.of<List<dynamic>>(context);
//     return Scaffold(
//       appBar:  CustomAppBar(),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Provider(
//           create: (context) => characters,
//           child: GridView.builder( gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 2 / 3,
//           crossAxisSpacing: 1,
//           mainAxisSpacing: 1,
//                 ),
//                 shrinkWrap: true,
//                 physics: const ClampingScrollPhysics(),
//                 padding: EdgeInsets.zero,
//                 itemCount: characters.length, 
//                  itemBuilder: (context, index) {
//                   return Center(
//                     child: Column(
//                       children: [
                        
//                         Text(characters[index]["id"]),
//                         Text(characters[index]["name"]),

//                       ],
//                     ),
//                   );
//                  },
                 
//                  ),
//         ),
//       ),
//     );
//   }


// }
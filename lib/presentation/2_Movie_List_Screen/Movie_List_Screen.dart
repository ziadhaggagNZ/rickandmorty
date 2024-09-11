import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CharactersBuilder.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomAppbar.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomFloatingActionButton.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomNavBar.dart';
import 'package:rickandmorty/provider/characters_provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final AutoScrollController _scrollController = AutoScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final provider = Provider.of<CharactersProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(context, provider), // Passing the provider
      backgroundColor: Colors.white,
      body: Consumer<CharactersProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: Image.asset("assets/Loading.gif"));
          }

          if (provider.characters.isEmpty) {
            return Center(child: Image.asset("assets/Empty.gif"));
          } else {
            return Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: CharactersBuilder(provider, _scrollController),
            );
          }
        },
      ),
      bottomNavigationBar: Custtom_Nav_Bar(context),
      floatingActionButton: Floating_Action_Button(
        scrollController: _scrollController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CharactersBuilder.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomAppbar.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomFloatingActionButton.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomNavBar.dart';
// import 'package:rickandmorty/provider/characters_provider.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';

// class MovieListScreen extends StatefulWidget {
//   MovieListScreen({super.key});

//   @override
//   _MovieListScreenState createState() => _MovieListScreenState();
// }

// class _MovieListScreenState extends State<MovieListScreen> {
// final AutoScrollController _scrollController = AutoScrollController();

//   @override
//   void dispose() {
//     _scrollController.dispose(); 
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(context,provider),
//       backgroundColor: Colors.white,
//       body: Consumer<CharactersProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return Center(child: Image.asset("assets/Loading.gif"));
//           }

//           if (provider.characters.isEmpty) {
//             return Center(child: Image.asset("assets/Empty.gif"));
//           } else {
//             return Container(
//               margin: const EdgeInsets.only(left: 10, right: 10, top: 20 ),
//               child: CharactersBuilder(provider ,_scrollController),
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: Custtom_Nav_Bar(context),
//       floatingActionButton: Floating_Action_Button(scrollController: _scrollController),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
//     );
//   }



 
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CharactersBuilder.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomAppbar.dart';
// import 'package:rickandmorty/provider/characters_provider.dart';

// class MovieListScreen extends StatefulWidget {
//   MovieListScreen({super.key});

//   @override
//   _MovieListScreenState createState() => _MovieListScreenState();
// }

// class _MovieListScreenState extends State<MovieListScreen> {
//   int _selectedIndex = 0; // Default index for bottom navigation items

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       backgroundColor: Colors.white,
//       body: Consumer<CharactersProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return Center(child: Image.asset("assets/Loading.gif"));
//           }

//           if (provider.characters.isEmpty) {
//             return Center(child: Image.asset("assets/Empty.gif"));
//           } else {
//             return Container(
//               margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
//               child: CharactersBuilder(provider),
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         shape: const CircularNotchedRectangle(), // Creates the notch for the FAB
//         notchMargin: 18, // Adjusts the notch margin
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.black : Colors.grey),
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 0;
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.search, color: _selectedIndex == 1 ? Colors.black : Colors.grey),
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 1;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(top: 60,left: 20, right: 20,), // Adjust padding as needed
//         child: FloatingActionButton(
//           onPressed: () {
//             // Action when the FAB is pressed
//           },
//           backgroundColor: Colors.red,
//           elevation: 8,
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Use endDocked for default behavior
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CharactersBuilder.dart';
// import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomAppbar.dart';
// import 'package:rickandmorty/provider/characters_provider.dart';

// class MovieListScreen extends StatelessWidget {
//   MovieListScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       backgroundColor: Colors.white,
//       body: Consumer<CharactersProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return Center(child: Image.asset("assets/Loading.gif"));
//           }

//           if (provider.characters.isEmpty) {
//             return Center(child: Image.asset("assets/Empty.gif"));
//           } else {
//             return Container(
//               margin: const EdgeInsets.only(left: 10,right: 10,top: 20),
//               child: CharactersBuilder(provider));
//           }
//         },
//       ),
//     );
//   }



// }




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
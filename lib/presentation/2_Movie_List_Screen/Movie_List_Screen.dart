import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CharactersBuilder.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomAppbar.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomFloatingActionButton.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/widgets/CustomNavBar.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

//Movie list screen class
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
    final provider = Provider.of<CharactersProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(context, provider), 
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
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20,bottom: 10),
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


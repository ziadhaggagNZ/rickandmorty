import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_Image.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/Character_data.dart';
import 'package:rickandmorty/presentation/3_Details_Screen/widgets/CustomAppBar_DetailsScreen.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';

class DetailsScreen extends StatefulWidget {
  final CharactersProvider provider;
  final int index;

  const DetailsScreen({Key? key, required this.provider, required this.index}) : super(key: key);

  @override
  DetailsScreenState createState() => DetailsScreenState();
}
//Details ScreenState class
class DetailsScreenState extends State<DetailsScreen> {
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

  @override
  Widget build(BuildContext context) {
    final character = widget.provider.characters[widget.index];

    return Scaffold(
      appBar: CustomAppBarDetailsScreen(context, character),
      body: Stack(
        children: [
          _isLoading
              ? Center(
                  child: Image.asset("assets/Loading.gif"),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Character_Image(context, character),
                      const SizedBox(height: 40),
                      Character_data_NameStatus(character),
                      Character_data_SpeciesGender(character),
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





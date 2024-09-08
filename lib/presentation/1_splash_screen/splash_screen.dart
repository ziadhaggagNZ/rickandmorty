import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/1_splash_screen/widgets/SplachAnimation_widgets.dart';
import 'package:rickandmorty/presentation/2_Movie_List_Screen/Movie_List_Screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  MovieListScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplachAnimation(),
    );
  }

 }
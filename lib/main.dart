import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/presentation/1_splash_screen/Splash_screen.dart';
import 'package:rickandmorty/provider/Characters_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, 
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, 
        ),
      ),
      home: SplashScreen(),
    );
  }
}




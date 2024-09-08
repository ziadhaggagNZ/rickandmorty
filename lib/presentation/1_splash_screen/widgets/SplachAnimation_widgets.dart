import 'package:flutter/material.dart';

class SplachAnimation extends StatefulWidget {
  const SplachAnimation({super.key});

  @override
  State<SplachAnimation> createState() => _SplachAnimationState();
}

class _SplachAnimationState extends State<SplachAnimation> {
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimating = true;
      });
    });

   
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(seconds: 2),
      alignment: _isAnimating ? Alignment.topCenter : Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        height: _isAnimating ? 65 : 300, 
        width: _isAnimating ? 80 : 300,  
        child: Image.asset("assets/RickandMorty_logo.jpg"),
      ),
    );
  }
}
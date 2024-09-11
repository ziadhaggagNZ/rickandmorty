import 'package:flutter/material.dart';

Column data_offline() {
    return Column(
        children: [
          const SizedBox(height: 100,),
         const Center(
                  child: Text(
                    'You are offline. Please check your internet connection.',
                    style: const TextStyle(fontSize: 20, ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 100),
                Center(
                  child: Image.asset("assets/sad.gif"),
                ),
        ],
      );
  }
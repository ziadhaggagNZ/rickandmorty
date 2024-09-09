  import 'package:flutter/material.dart';

Widget Floating_Action_Button() {
  
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20), 
      child: FloatingActionButton(
        onPressed: () {
            //!\\\\\\\\\\\\\\\\\\
        },
        backgroundColor: Colors.white,
        elevation: 8,
        child: Icon(
          Icons.home,
          color: Colors.black,
        ),
      ),
    );
  }
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart'; 

Widget Floating_Action_Button({required AutoScrollController scrollController}) {
  return Padding(
    padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
    child: SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
           scrollController.scrollToIndex(
            0,
            preferPosition: AutoScrollPosition.begin,
            duration: const Duration(milliseconds: 500),
           );
        },
        backgroundColor: Colors.white,
        elevation: 8,
        child: Icon(
          Icons.home_outlined,
          color: Colors.black,
          size: 40,
        ),
      ),
    ),
  );
}


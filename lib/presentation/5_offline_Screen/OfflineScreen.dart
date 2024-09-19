import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/5_offline_Screen/widgets/CustomAppbar_offline.dart';
import 'package:rickandmorty/presentation/5_offline_Screen/widgets/Data_offline.dart';

//offline screen class
class Offlinescreen extends StatelessWidget {
  const Offlinescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar_offline(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: data_offline(),
      ),
    );
  }
}
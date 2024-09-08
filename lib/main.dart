import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/1_splash_screen/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
void main() {
    runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rick and Morty',
      home: Scaffold(
        body:  SplashScreen(), 
      ),
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}




// //import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:rickandmorty/data/characters_web_services.dart';

// late List<dynamic> characters;

// void main()async {
//  CharactersWebServices charactersWebServices = CharactersWebServices();
//    characters = await charactersWebServices.getAllCharacters();
//   // runApp(
//   //   DevicePreview(
//   //     enabled: true,
//   //     tools: const [
//   //       ...DevicePreview.defaultTools,
//   //     ],
//   //     builder: (context) => const MyApp(),
//   //   ),
//   // );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

 
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rick and Morty',
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: SizedBox(
//             height: MediaQuery.sizeOf(context).height,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 //Text(characters[1]["name"]),
//                 Container(
//                   //height: 300,
//                   width: 300,
//                   child:Image.asset("assets/RickandMorty_logo.jpg"),
//                   )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



















// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';

// void main() {
//     runApp(
//     DevicePreview(
//       enabled: true,
//       tools: const [
//         ...DevicePreview.defaultTools,
//       ],
//       builder: (context) =>  MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimatedLogoScreen(),
//     );
//   }
// }

// class AnimatedLogoScreen extends StatefulWidget {
//   @override
//   _AnimatedLogoScreenState createState() => _AnimatedLogoScreenState();
// }

// class _AnimatedLogoScreenState extends State<AnimatedLogoScreen> {
//   bool _isLogoAtTop = false;

//   @override
//   void initState() {
//     super.initState();
//     // Delay the animation for a short duration
//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         _isLogoAtTop = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Your main content or background here
//           Positioned.fill(
//             child: Container(
//               color: Colors.white, // Background color
//             ),
//           ),
//           // Animated logo using AnimatedPositioned
//           AnimatedPositioned(
//             duration: Duration(seconds: 2),
//             curve: Curves.easeInOut,
//             top: _isLogoAtTop ? 50.0 : MediaQuery.of(context).size.height / 2 - 50,
//             left: MediaQuery.of(context).size.width / 2 - 50,
//             child: AnimatedOpacity(
//               duration: Duration(seconds: 1),
//               opacity: _isLogoAtTop ? 1.0 : 0.5, // Optional opacity animation
//               child: LogoWidget(), // Replace with your logo widget
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LogoWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         shape: BoxShape.circle,
//       ),
//       child: Center(
//         child: Text(
//           'Logo', // Replace with your logo image or widget
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//       ),
//     );
//   }
// }










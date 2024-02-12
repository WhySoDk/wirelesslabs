import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application .
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: " Named ␣ Route ␣ Demo ",
        initialRoute: "/",
        routes: {
          "/": (context) => const FirstScreen(),
          "/second": (context) => const SecondScreen(),
        });
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("’ First ␣ Screen ’"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen when tapped .
            // TODO 2: Update Navigator with Push Named route here
            Navigator . pushNamed ( context , "/second");
          },
          child: const Text("’ Launch ␣ screen ’"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("’ Second ␣ Screen ’"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first screen when tapped .
            // TODO 3: Update code to return to FirstScreen Pop ()
            Navigator.pop(context);
          },
          child: const Text("’ Go ␣ back ! ’"),
        ),
      ),
    );
  }
}

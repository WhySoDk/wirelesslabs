import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

void main() {
  runApp(App705());
}

class App705 extends StatelessWidget {
  const App705({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App 705',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num _randno = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App705'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Text(_randno.toString()),
            SizedBox(height: 20,),
            // How ew detect change
            TextButton(
                onPressed: (){
                  setState(() {
                    _randno = 1+Random().nextInt(100);
                  });
                },
                child:
                Text('Press Me')),
          ],
        ),
      ),
    );
  }
}
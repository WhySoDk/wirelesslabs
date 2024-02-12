import "package:flutter/material.dart";
void main () {
  runApp ( const MyApp ());}

class MyApp extends StatelessWidget {
  const MyApp ({ Key ? key }) : super ( key : key );
// This widget is the root of your application .
  @override
  Widget build ( BuildContext context ) {
    return MaterialApp (
      title : " Route ␣ Push ␣ Demo " ,
      theme : ThemeData (
        primarySwatch : Colors . blue ,
      ) ,
      home : const FirstRoute () ,
// Initially FirstRoute
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'First page',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              child: Text('Go to second'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SecondRoute(data: 'Hello there from the first page')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final String data;
  SecondRoute({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SecondRoute Route'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Second page',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                data,
                style: const TextStyle(fontSize: 20, color: Colors.blue),
              ),
              ElevatedButton(
                child: const Text('Go Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
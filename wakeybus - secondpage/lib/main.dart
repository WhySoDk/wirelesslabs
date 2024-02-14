import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:settings_ui/settings_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wakeybus Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        hintColor: Colors.amber,
        useMaterial3: true,
      ),
        initialRoute: "/",
        routes: {
          "/": (context) => const MyHomePage(),
          "/Setting": (context) => const Setting(data: '',),
        }
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({Key? key, required this.data}) : super(key: key);
  final String data;
  final String title = "Setting";
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Section 1'),
            tiles: [
              SettingsTile(
                title: Text(data+" phichitphanphong"),
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          MapSample(),
          SearchBarApp(),
        ],
      ),
    );
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizedBox(
          width: 100,
          height: 5.0,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            // Set the background color to transparent
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
              child: Row(
                // Use Row to arrange widgets horizontally
                children: [
                  IconButton.filled(
                    icon: const Icon(Icons.settings),
                    selectedIcon: const Icon(Icons.settings),
                    color: const Color(0xFFFFFFFF),
                    onPressed: () {
                      Navigator.pushNamed(context, "/Setting", arguments: 'Thanat');
                    },
                  ),
                  Expanded(
                    // Use Expanded to make the search bar fill the remaining space
                    child: SearchAnchor(
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search), // Search Icon
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.79465063169504, 100.3247490794993),
    zoom: 19,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

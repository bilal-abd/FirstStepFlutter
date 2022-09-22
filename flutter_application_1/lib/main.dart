import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Clientlistscreen.dart';
import 'package:flutter_application_1/pages/formulaire.dart';
import 'package:flutter_application_1/pages/index.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClientListScreen(),
      routes: {
        'liste': (context) => IndexPage(),
        'formulaire': (context) => Formulaire(),
      },
    );
  }
}

class PageBasique extends StatelessWidget {
  const PageBasique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Créer un Widget Stateless"),
      ),
      body: const WidgStateless(),
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color.fromARGB(255, 6, 52, 88),
          fontSize: 15,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class WidgStateless extends StatelessWidget {
  const WidgStateless({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('Maurice Paul',
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 59, 105),
                    fontWeight: FontWeight.bold)),
            subtitle: const Text('PDG'),
            trailing: Wrap(
              spacing: 40,
              children: const <Widget>[
                Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 3, 59, 105),
                ),
                Icon(Icons.message),
                Icon(Icons.call),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

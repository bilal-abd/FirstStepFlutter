import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

Future postData(Post formPost) async {
  var response =
      await http.post(Uri.parse("https://jsonplaceholder.typicode.com/users"),
          body: jsonEncode({
            "id": formPost.id.toString(),
            "name": formPost.name,
            "phone": formPost.phone,
            "email": formPost.email,
          }));
  if (response.statusCode == 201) {
    var jsonResponse = jsonDecode(response.body);
    return Post(
        name: formPost.name,
        id: jsonResponse['id'],
        email: formPost.email,
        phone: formPost.phone);
  } else {
    print('fail');
  }
}

class _FormulaireState extends State<Formulaire> {
  final _formKey = GlobalKey<FormState>();
  Post formPost = Post(id: 0, email: '', name: '', phone: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(90, 96, 125, 139),
        title: const Text('Formulaire'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check_circle_outline, color: Colors.green),
            onPressed: () async {
              await postData(formPost);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(155, 161, 174, 185),
      body: Column(children: [
        Card(
          color: const Color.fromARGB(255, 214, 214, 214),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Informations"),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Nom'),
                  onSaved: (name) => formPost.name = name ?? '',
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Société'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Postes'),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 214, 214, 214),
          child: Form(
            child: Column(
              children: [
                Text("Coordonées"),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call), hintText: 'Num pro'),
                  onSaved: (phone) => formPost.phone = phone ?? '',
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mobile_friendly),
                      hintText: 'Num fix'),
                  onSaved: (phone) => formPost.phone = phone ?? '',
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_iphone),
                      hintText: 'Num perso'),
                  onSaved: (phone) => formPost.phone = phone ?? '',
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail), hintText: 'Mail'),
                  onSaved: (email) => formPost.email = email ?? '',
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

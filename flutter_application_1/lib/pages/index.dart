import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class User {}

class _IndexPageState extends State<IndexPage> {
  List<Post> users = [];
  bool isLoading = false;
  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  Future<void> fetchUser() async {
    var url = Uri.https(
      'jsonplaceholder.typicode.com',
      'users',
    );
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List<Post> userList =
          items.map<Post>((userMap) => Post.fromJson(userMap)).toList();
      // List<Post> userList = items.forEach(())
      setState(() {
        users = userList;
      });
    } else {
      setState(() {
        users = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon app"),
      ),
      body: page1(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'formulaire');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget page1() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(post: users[index]);
        });
  }

  Widget getCard({required Post post}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    post.name.toString(),
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.call),
                        ),
                        TextSpan(text: post.phone.toString())
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.mail),
                        ),
                        TextSpan(text: post.email.toString())
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

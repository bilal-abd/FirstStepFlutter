import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Client.dart';
import 'package:flutter_application_1/pages/addClient.dart';
import 'package:get/get.dart';

class ClientListScreen extends StatelessWidget {
  const ClientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6e6e5),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(FormClientPage());
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        title: Text(
          'Clients',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 1, 36, 65)),
        ),
        backgroundColor: Color(0xFFe6e6e5),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: clientList.length,
            itemBuilder: (context, index) {
              Client client = clientList[index];
              return Card(
                child: ListTile(
                  title: Text(
                    client.nom,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    client.adresse,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

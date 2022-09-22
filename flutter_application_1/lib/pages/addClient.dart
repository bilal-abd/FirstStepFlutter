import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Client.dart';

class FormClientPage extends StatelessWidget {
  const FormClientPage({super.key});

  void addClientList() {}

  @override
  Widget build(BuildContext context) {
    RxString adresse = "".obs;
    RxInt phone = 0.obs;
    RxString name = "".obs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (() {
                Client client1 = Client(
                    adresse: adresse.value,
                    nom: name.value,
                    telephone: phone.value,
                    id: 25);
                clientList.add(client1);
                Get.back();
              }),
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
        title: const Text(
          'Nouveau Client',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFe6e6e5),
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Ajouter le nom du client',
                hintStyle: TextStyle(fontWeight: FontWeight.w600)),
            onChanged: (val) {
              name.value = val.toString();
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_sharp,
                  color: Colors.black,
                ),
                hintText: 'Ajouter une adresse'),
            onChanged: (newValue) {
              adresse.value = newValue.toString();
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Ajouter un numéro de téléphone',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                )),
            onChanged: (newValue) {
              phone.value = int.parse(newValue.toString());
            },
            keyboardType: TextInputType.phone,
          ),
        ],
      )),
    );
  }
}

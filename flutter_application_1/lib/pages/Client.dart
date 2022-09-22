import 'package:get/get.dart';

class Client {
  int id;
  String nom;
  String adresse;
  int telephone;

  Client({
    required this.id,
    required this.nom,
    required this.adresse,
    required this.telephone,
  });
}

RxList<Client> clientList = [
  Client(id: 1, nom: 'Xefi', adresse: 'Chemin de Xefi', telephone: 0626060606),
  Client(
      id: 2,
      nom: 'Google',
      adresse: 'adresse de google',
      telephone: 0635463655),
  Client(
      id: 3,
      nom: 'Youtube',
      adresse: 'adresse de Youtube',
      telephone: 0635463655),
  Client(
      id: 4,
      nom: 'Twitter',
      adresse: 'adresse de Twitter',
      telephone: 0635463655),
  Client(
      id: 5,
      nom: 'Logitech',
      adresse: 'adresse de Logitech',
      telephone: 0635463655),
].obs;

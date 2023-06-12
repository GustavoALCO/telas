import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telas/entidades/contact.dart';

import '../server/client.dart';



class MostrarContatosScreen extends StatefulWidget {
  @override
  _MostrarContatosScreenState createState() => _MostrarContatosScreenState();
}


class _MostrarContatosScreenState extends State<MostrarContatosScreen> {
  Future<List<Contact>> getContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? "";
    final data = await ServerClient.getContactsFromClient(email);
    print(data);
    return data;
  }

  bool selectAll = false;
  int contatoSelecionadoIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        backgroundColor: const Color.fromRGBO(23, 185, 188, 100),
      ),
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      body: FutureBuilder<List<Contact>>(
        future: getContacts(),
        builder: (context, snapshot) {
          print('montar tela');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            print('tem dados');
            List<Contact> contacts = snapshot.data ?? [];
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(contact.photo),
                  ),
                  title: Text(
                    contact.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    contact.phone,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  tileColor:
                      index == contatoSelecionadoIndex ? const Color(0xFF17B9BC) : null,
                  onTap: () {
                    setState(() {
                      contatoSelecionadoIndex = index;
                    });
                    // Ação a ser executada quando o contato for selecionado
                    // Por exemplo, abrir uma tela de detalhes do contato
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

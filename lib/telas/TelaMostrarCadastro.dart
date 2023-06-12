import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telas/telas/telaChat.dart';
import 'package:telas/telas/telaprincipal.dart';

import '../entidades/contact.dart';
import '../server/client.dart';

class TelaContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: telaContato(),
    );
  }
}

class telaContato extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<telaContato> {
  List<Contact> contacts = [];

  bool selectAll = false;
  List<Contact> selectedContacts = [];

  Future<List<Contact>> getContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? "";
    final data = await ServerClient.getContactsFromClient(email);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 185, 188, 100),
        title: const Text('Lista de Contatos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Telaprincipal())
                //voltando a tela
                );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_box_outlined),
            onPressed: () {
              setState(() {
                selectAll = !selectAll;
                contacts.forEach((contact) {
                  contact.selected = selectAll;
                });
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Contact>>(
          future: getContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) return const CircularProgressIndicator();
            if (snapshot.hasError) return Text('Erro: ${snapshot.error}');
            contacts = snapshot.data ?? [];
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaChat(
                            contact: contact,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(contact.photo),
                      ),
                      title: Text(
                        contact.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Checkbox(
                        value: contact.selected,
                        onChanged: (value) {
                          setState(() {
                            contact.selected = value!;
                          });
                        },
                      ),
                      subtitle: Text(
                        contact.phone,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                );
              },
            );
          }),  floatingActionButton: FloatingActionButton(
        onPressed: () {
          // botão para pegar a informação de todos os clientes
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:telas/telaChat.dart';
import 'package:telas/telaprincipal.dart';

class TelaContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(
         seedColor: Color.fromRGBO(23, 185, 188, 100), 

        ),
           scaffoldBackgroundColor: Color.fromRGBO(45, 45, 45, 1)
         ),
          
      home: telaContato(),
    );
  }
}

class Contact {
  final String name;
  final String photo;
  bool selected;

  Contact({required this.name, required this.photo, this.selected = false});
}

class telaContato extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<telaContato> {
  List<Contact> contacts = [
    Contact(name: 'Contato 1', photo: 'assets/images/Logo_Omnichan.png'),
    Contact(name: 'Contato 2', photo: 'assets/images/Logo_Omnichan.png'),
    //para adicionar os contatos
  ];

  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Telaprincipal())
                        //voltando a tela

                        );
            },
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.check_box_outlined),
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
      body: ListView.builder(
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
                title: Text(contact.name),
                trailing: Checkbox(
                  value: contact.selected,
                  onChanged: (value) {
                    setState(() {
                      contact.selected = value!;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entidades/contact.dart';
import '../server/client.dart';


class CadastrarContatosScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF2D2D2D),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFA7A7A7),
                    labelText: 'Nome',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: telefoneController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFA7A7A7),
                    labelText: 'Telefone',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFA7A7A7),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? email = prefs.getString('email');
                    String? senha = prefs.getString('senha');
                    String telefone = telefoneController.text;
                    String nome = nomeController.text;
                    List<Contact> contacts = List.of([Contact(name: nome, photo: "", phone: telefone)]);
                    if (email != null && senha != null) {
                        print("Cadastrando contato " + email + " nome " + nome);
                        await ServerClient.addContactsFromEmail(email, contacts);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF17B9BC),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'Cadastrar',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF17B9BC),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'Voltar',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

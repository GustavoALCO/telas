import 'package:flutter/material.dart';

class Contato {
  final String nome;
  final String telefone;

  Contato({required this.nome, required this.telefone});
}

class MostrarContatosScreen extends StatefulWidget {
  @override
  _MostrarContatosScreenState createState() => _MostrarContatosScreenState();
}

class _MostrarContatosScreenState extends State<MostrarContatosScreen> {
  List<Contato> contatos = [
    Contato(nome: 'João', telefone: '(11) 1234-5678'),
    Contato(nome: 'Maria', telefone: '(11) 9876-5432'),
    Contato(nome: 'Gilberto', telefone: '0500-2011-040'),
    Contato(nome: 'Julia', telefone: '(11) 4002-8922'),
    Contato(nome: 'BobMarley', telefone: '(11) 5555-5555'),
  ];

  int contatoSelecionadoIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        backgroundColor: Color(0xFF17B9BC),
      ),
      backgroundColor: Color(0xFF2D2D2D),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final contato = contatos[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(
              contato.nome,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              contato.telefone,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            tileColor:
                index == contatoSelecionadoIndex ? Color(0xFF17B9BC) : null,
            onTap: () {
              setState(() {
                contatoSelecionadoIndex = index;
              });
              // Ação a ser executada quando o contato for selecionado
              // Por exemplo, abrir uma tela de detalhes do contato
            },
          );
        },
      ),
    );
  }
}

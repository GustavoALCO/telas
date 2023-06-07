import 'package:flutter/material.dart';
import 'package:telas/TelaMostrarCadastro.dart';
import 'package:telas/usuario.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 45, 100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Usuário',
              imagePath: 'assets/images/agenda.png',
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsuarioScreen())
                        //Chamando tela de usuarios 

                        );
              },
            ),
            SizedBox(height: 30),
            CustomButton(
              label: 'Respostas',
              imagePath: 'assets/images/Logo_Omnichan.png',
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaContato())
                        //Chamando tela de respostas 

                        );
              },
            ),
            SizedBox(height: 30),
            CustomButton(
              label: 'Lista de Transmissão',
              imagePath: 'assets/images/anuncios.png',
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaContato())
                        //Chamando tela de Transmissao 

                        );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onPressed;

  const CustomButton({
    required this.label,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Color.fromRGBO(23, 185, 188, 100),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: onPressed,
            child: Center(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class Telaprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
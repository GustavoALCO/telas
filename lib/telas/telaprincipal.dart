import 'package:flutter/material.dart';
import 'package:telas/telas/TelaMostrarCadastro.dart';
import 'package:telas/telas/usuario.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Widget> makeCustomButton(BuildContext c, String label, String imgPath, WidgetBuilder b) {
    return [
      CustomButton(
          label: label,
          imagePath: imgPath,
          onPressed: () => Navigator.push(c, MaterialPageRoute(builder: b)),
        ),
        const SizedBox(height: 30),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...makeCustomButton(
              context,
              'Usuário',
              'assets/images/agenda.png',
              (context) => UsuarioScreen(),
            ),
            ...makeCustomButton(
              context,
              'Respostas',
              'assets/images/Logo_Omnichan.png',
              (context) => TelaContato(),
            ),
            ...makeCustomButton(
              context,
              'Lista de Transmissão',
              'assets/images/anuncios.png',
              (context) => TelaContato(),
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
    super.key, 
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
            color: const Color.fromRGBO(23, 185, 188, 100),
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
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

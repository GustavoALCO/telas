import 'package:flutter/material.dart';
import 'package:telas/usuario.dart';
import 'package:telas/respostas.dart';
import 'package:telas/lista_transmissao.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela com Botões',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/usuario': (context) => UsuarioScreen(),
        '/respostas': (context) => RespostasScreen(),
        '/listaTransmissao': (context) => ListaTransmissaoScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              icon: Icons.person,
              label: 'Usuário',
              onPressed: () {
                Navigator.pushNamed(context, '/usuario');
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              icon: Icons.chat,
              label: 'Respostas',
              onPressed: () {
                Navigator.pushNamed(context, '/respostas');
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              icon: Icons.list,
              label: 'Lista de Transmissão',
              onPressed: () {
                Navigator.pushNamed(context, '/listaTransmissao');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: widget.onPressed,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: _isPressed ? Color(0xFF00FBFF) : Color(0xFF17B9BC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
              size: 48,
            ),
            SizedBox(height: 8),
            Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

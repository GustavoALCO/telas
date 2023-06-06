import 'package:flutter/material.dart';
import 'package:telas/cadastrar_contatos.dart';
import 'package:telas/mostrar_contatos.dart';

void main() => runApp(UsuarioScreen());

class UsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela com Botões',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              icon: Icons.import_contacts,
              label: 'Importar contatos',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ImportarContatosDialog(),
                );
              },
            ),
            SizedBox(width: 16),
            CustomButton(
              icon: Icons.person_add,
              label: 'Cadastrar contatos',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastrarContatosScreen(),
                  ),
                );
              },
            ),
            SizedBox(width: 16),
            CustomButton(
              icon: Icons.contacts,
              label: 'Mostrar contatos',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MostrarContatosScreen(),
                  ),
                );
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
          borderRadius: BorderRadius.circular(10),
          color: _isPressed ? Color(0xFF00FBFF) : Color(0xFF17B9BC),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
              size: 60,
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

class ImportarContatosDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF2D2D2D),
      title: Text(
        'Importar contatos',
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Para importar os contatos, selecione um arquivo CSV ou Vcard.',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Ação para selecionar o arquivo
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF17B9BC),
            ),
            child: Text('Selecionar arquivo'),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //importar o arquivo
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF17B9BC),
              ),
              child: Text('Importar'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Cancelar'),
            ),
          ],
        ),
      ],
    );
  }
}

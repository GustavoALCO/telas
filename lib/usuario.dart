import 'package:flutter/material.dart';
import 'package:telas/telaprincipal.dart';
import 'cadastrar_contatos.dart';
import 'mostrar_contatos.dart';



class UsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela com Botões',
      theme: ThemeData(
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 100),
  appBar: AppBar(
    
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
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Tela de Contatos'),
       
      ),
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
          color: _isPressed ? Color(0xFF00FBFF) : Color.fromRGBO(23, 185, 188, 100),
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
      backgroundColor: const Color.fromRGBO(45, 45, 45, 100),
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
              primary: Color.fromRGBO(23, 185, 188, 100),
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
                primary: Color.fromRGBO(23, 185, 188, 100),
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

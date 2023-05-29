import 'package:flutter/material.dart';

class telaCadastro extends StatelessWidget {
  const telaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [   Expanded(child: Container(
            color: const Color.fromRGBO(45, 45, 45, 100),
          ),
          ),]
        ),
      ),
    );

    
  }
}
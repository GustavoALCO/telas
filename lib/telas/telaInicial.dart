import 'package:flutter/material.dart';
import 'package:telas/telas/telaCadastro.dart';
import 'package:telas/telas/telaLogin.dart';

class telaInicial extends StatefulWidget {
  @override
  _telaInicial createState() => _telaInicial();
}

class _telaInicial extends State<telaInicial> {
  

  @override
   Widget build(BuildContext context) {
   
     return Scaffold(
      
        body: Stack(
          children: [
            Align(
               alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Ominichan",
                  style: TextStyle(
                    fontSize: 24,
    color: Color.fromRGBO(23, 185, 188, 100),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold, 
  ),
                  ),)
                  ),
                  
            
            
            Center(
              child: Container(
                height: 200,
                width: 200,
                child : Image.asset('assets/images/Logo_Omnichan.png')
                
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 550),
              child: Center(
                child: Container(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => telaLogin()),
                      );
                    },
                    child: Container(
                        child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 680),
              child: Center(
                child: Container(
                  
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                        ),
                    onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => telaCadastro()),
                    );
                    },
                    child: Container(
                        child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(
         seedColor: Color.fromRGBO(23, 185, 188, 100), 

        ),
           scaffoldBackgroundColor: Color.fromRGBO(45, 45, 45, 1)
         ),
          
      home: telaInicial(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:telas/telas/TelaMostrarCadastro.dart';



class telaLogin extends StatefulWidget {
  @override
  _telaLogin createState() => _telaLogin();
}

class _telaLogin extends  State<telaLogin> {

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();
       
      return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
        toolbarHeight: 30,
      ),
        body: Stack(
          children: [
            Expanded(
            child : Center(
              child: Container(
                padding: EdgeInsets.only(top: 350),
                width: 200
              ),
            ),
            ),
            
             Center(
              
              child: Container(
                 
                height: 200,
                width: 200,
                child :  Image.asset('assets/images/Logo_Omnichan.png')
                
              ),
            ),
             Center(
              child: Container(
                width: 250,
                padding: EdgeInsets.only(top: 230),
                child: TextField(
                  controller: emailController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  
                          
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                
                    ),
              ),
            ),
            Center(
              child: Container(
                width: 250,
                padding: EdgeInsets.only(top: 370),
                child: TextField(
                  controller: senhaController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Senha",
                                  labelStyle: TextStyle(color: Colors.white),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  
                                ),
                    obscureText: true,              
                    ),
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
                      MaterialPageRoute(builder: (context) => telaContato())
                      );
                      
                    },
                    child:  const Text(
                      'Entrar',
                      style: TextStyle(
                    fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
             ),
          ],
        ),
      );
  }
}

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
         ),
          
      home: telaLogin(),
    );
  }
}
import 'package:flutter/material.dart';

class telaCadastro extends StatefulWidget {
  @override
  _telaCadastro createState() => _telaCadastro();
}



class _telaCadastro extends State<telaCadastro> {
  
  @override
     
     final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
    
    elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
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
          
            Container(
              padding: EdgeInsets.only(top: 30),
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
        
            Container(
              padding: EdgeInsets.only(top: 30),
              child: TextField( 
                controller: dataNascimentoController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                                    labelText: "Data De Nascimento",
                                    labelStyle: TextStyle(color: Colors.white),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    
                            
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                   
                keyboardType: TextInputType.datetime,
              ),
            ),
           
            Container(
              padding: EdgeInsets.only(top: 30),
              child: TextField(
                controller: nomeController,
                style: TextStyle(color: Colors.white),
               decoration: InputDecoration(
                                    labelText: "Nome",
                                    labelStyle: TextStyle(color: Colors.white),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    
                            
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                  
              ),
            ),
            
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Container(
                  
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                          ),
                      onPressed: () {
                        
                      },
                      child: Container(
                          child: Text(
                        'Cadastrar',
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
      ),
    );
  }
}

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: telaCadastro(),
    );
  }
}
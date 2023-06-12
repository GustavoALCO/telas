import 'package:flutter/material.dart';


class telaCadastro extends StatefulWidget {
  @override
  _telaCadastro createState() => _telaCadastro();
}



class _telaCadastro extends State<telaCadastro> {
  
  @override
     
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 45, 100),
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
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Container(
                  
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(23, 185, 188, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                          ),
                      onPressed: () {
                        //botão para cadastrar novo usuario
                      String email = emailController.text;
                      String senha = senhaController.text;


                      },
                      child: Container(
                        color: Color.fromRGBO(23, 185, 188, 100),
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
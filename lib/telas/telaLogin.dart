import 'package:flutter/material.dart';

class telaLogin extends StatelessWidget {
  const telaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
      home: Scaffold(
        body: Stack(
          children: [
            Expanded(child:
            Container(color: Color.fromARGB(45 , 45, 45, 100),
            child : Center(
              child: Container(
                padding: EdgeInsets.only(top: 350),
                width: 200
              ),
            ),
            ),
            ),
             Center(
              
              child: Container(
                 
                height: 200,
                width: 200,
                child : const Icon(Icons.rocket_launch,
                size: 50,),
                
              ),
            ),
             Center(
              child: Container(
                width: 250,
                padding: EdgeInsets.only(top: 230),
                child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  border: OutlineInputBorder(
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
                                decoration: InputDecoration(
                                  labelText: "Senha",
                                  
                                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  border: OutlineInputBorder(
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
                        primary: Color.fromRGBO(23, 185, 188, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    onPressed: () {
                      print("nivel1");
                    },
                    child: Container(
                        child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                        ),
                    ),
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
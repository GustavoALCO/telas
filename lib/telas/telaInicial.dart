import 'package:flutter/material.dart';

class telaInicial extends StatelessWidget {
  const telaInicial({super.key});

  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: Container(
                color: const Color.fromRGBO(45, 45, 45, 100),
                child: Container(
                  padding: const EdgeInsets.only(top: 420),
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(23, 185, 188, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )
                            ),
                        onPressed: () {
                          print("nivel1");
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
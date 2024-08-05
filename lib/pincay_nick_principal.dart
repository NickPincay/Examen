import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PincayNickPrincipal extends StatelessWidget {
  const PincayNickPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Principal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/image-perfil.jpg',
              width: 200,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue[600],
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      'Datos Personales',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Nombres: ',
                                    style: TextStyle(color: Colors.white)),
                                Text('Pincay Palma',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            Row(
                              children: [
                                Text('Apellidos: ',
                                    style: TextStyle(color: Colors.white)),
                                Text('Pincay Palma',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            Row(
                              children: [
                                Text('Edad: ',
                                    style: TextStyle(color: Colors.white)),
                                Text('23',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            Row(
                              children: [
                                Text('Fecha Nacimiento: ',
                                    style: TextStyle(color: Colors.white)),
                                Text('21 de septiembre de 2000',
                                    style: TextStyle(color: Colors.white))
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import 'package:pincay_nick_examen/models/pincay_nick_usuario.dart';

class PincayNickConsultaUsuario extends StatelessWidget {
  const PincayNickConsultaUsuario({super.key});

  Future<List<PincayNickUsuario>> loadUsuarios() async {
    final xmlString = await rootBundle.loadString('assets/usuarios.xml');
    final document = xml.XmlDocument.parse(xmlString);
    final usuarios = document.findAllElements('usuario');

    return usuarios.map((element) {
      final nombres = element.findElements('nombres').single.text;
      final fechaNac = element.findElements('fechaNac').single.text;
      final correo = element.findElements('correo').single.text;
      final estadoCivil = element.findElements('estadoCivil').single.text;
      final url = element.findElements('url').single.text;

      return PincayNickUsuario(
        nombres: nombres,
        fechaNac: fechaNac,
        correo: correo,
        estadoCivil: estadoCivil,
        url: url,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consulta Usuario',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<PincayNickUsuario>>(
        future: loadUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay usuarios disponibles'));
          } else {
            final usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                final usuario = usuarios[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blue[600],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            'Datos Personales',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.network(
                                usuario.url,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    size: 80,
                                    color: Colors.white,
                                  );
                                },
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Nombres: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(usuario.nombres,
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Fecha Nacimiento: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(usuario.fechaNac,
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Correo: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(usuario.correo,
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Estado Civil: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(usuario.estadoCivil,
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

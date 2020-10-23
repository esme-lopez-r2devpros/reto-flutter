import 'package:flutter/material.dart';
import 'package:reto_flutter/src/models/ComidaModel.dart';
import 'package:reto_flutter/src/providers/comidas_provider.dart';

class HomePage extends StatelessWidget {
  final comidasProvider = new ComidasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[800],
          child: _crearListadoComidas(),
        ),
      ),
    );
  }

  Widget _crearListadoComidas() {
    return FutureBuilder(
      future: comidasProvider.cargarComidas(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ComidaModel>> snapshot) {
        if (snapshot.hasData) {
          final comidas = snapshot.data;
          return GridView.builder(
            itemCount: comidas.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, i) => _crearComida(context, comidas[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Column _crearComida(BuildContext context, ComidaModel comida) {
    final screensize = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          child: Container(
            width: screensize.width * 0.40,
            margin: EdgeInsets.all(screensize.width * 0.05),
            child: Column(
              children: [
                (comida.imageUrl == null)
                    ? Image(image: AssetImage('assets/no-image.png'))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
                          image: NetworkImage(comida.imageUrl),
                          placeholder: AssetImage('assets/loading.gif'),
                          fadeInDuration: Duration(seconds: 1),
                          fit: BoxFit.cover,
                        ),
                      ),
                Text(comida.name,
                    style: TextStyle(fontSize: 15.0, color: Colors.grey[400]), textAlign: TextAlign.center,)
              ],
            ),
          ),
          onTap: () =>
              Navigator.pushNamed(context, 'detalle', arguments: comida),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reto_flutter/src/models/ComidaModel.dart';
import 'package:reto_flutter/src/providers/comidas_provider.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  final comidasProvider = new ComidasProvider();
  ComidaModel comida = new ComidaModel();

  final styleRating =
      TextStyle(color: Colors.grey[400], fontSize: 16.0, fontFamily: 'Arial');

  final styleDescription = TextStyle(
    color: Colors.grey[400],
    fontSize: 15.0,
    fontFamily: 'Arial Nova',
  );

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    ComidaModel comidaData = ModalRoute.of(context).settings.arguments;
    if (comidaData != null) {
      comida = comidaData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(comida.name,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
        backgroundColor: Colors.grey[800],
        toolbarHeight: 100.0,
        leading: GestureDetector(
          child: Icon(Icons.chevron_left),
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_dining),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[800],
          child: Column(
            children: [
              _verImagen(),
              _verRating(),
              Wrap(           
                direction: Axis.vertical,
                spacing: 10.0,
                runSpacing:20.0,
                children: [
                  Row(
                    children: [
                      _crearTag(),
                      _crearTag(),
                      _crearTag(),
                      _crearTag(),
                      _crearTag(),
                      _crearTag(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verImagen() {
    return Container(
      width: double.infinity,
      child: FadeInImage(
        image: NetworkImage(comida.imageUrl),
        placeholder: AssetImage('assets/loading.gif'),
        fadeInDuration: Duration(seconds: 2),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _verRating() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    _crearIconoEstrella(),
                    _crearIconoEstrella(),
                    _crearIconoEstrella(),
                    _crearIconoEstrella(),
                    _crearIconoEstrella(),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
              Text(
                '(${comida.rating})',
                style: styleRating,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            comida.description,
            style: styleDescription,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _crearIconoEstrella() {
    return Icon(
      Icons.star,
      color: Colors.yellow[300],
      size: 25.0,
    );
  }

  Widget _crearTag() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.blue[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('MAIN DISH'),
        ),
      ),
    );
  }
}

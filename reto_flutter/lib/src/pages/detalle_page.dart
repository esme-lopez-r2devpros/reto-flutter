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
          height: 2000.0,
          color: Colors.grey[800],
          child: Column(
            children: [
              _verImagen(),
              _verRating(),
              _showTags(),
              _showHour(),
             // _createSuggestion(context, comida.suggestions),
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
        padding: EdgeInsets.all(8.0),
        color: Colors.blue[300],
        child: Text('MAIN DISH'),
      ),
    );
  }

  Widget _showTags() {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 0.0,
      runSpacing: 5.0,
      children: [
        _crearTag(),
        _crearTag(),
        _crearTag(),
        _crearTag(),
        _crearTag(),
        _crearTag(),
        _crearTag(),
        _crearTag(),
      ],
    );
  }

  Widget _showHour() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(children: [
        Icon(Icons.access_time, color: Colors.grey[300], size: 30.0),
        Column(
          children: [
            Text(
              '${comida.dateStart.hour.toString()}- ${comida.dateEnd.hour.toString()}',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[300]),
            ),
            Text(
              'Served during breakfast hours only',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
            ),
          ],
        ),
      ]),
    );
  }
 Widget _createSuggestion(BuildContext context, List<dynamic> suggestions) {
   if(suggestions!=null)
   {
     return GridView.builder(
            itemCount: suggestions.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, i) => _create(context, suggestions[i]),
          );
   }
   else{
     return CircularProgressIndicator();
   }      
  }

  Widget _create(BuildContext context,Suggestion suggestion){
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
                          image: NetworkImage(suggestion.imageUrl),
                          placeholder: AssetImage('assets/loading.gif'),
                          fadeInDuration: Duration(seconds: 5),
                          fit: BoxFit.cover,
                        ),
                      ),
                Text(suggestion.name,
                    style: TextStyle(fontSize: 15.0, color: Colors.grey[400]))
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

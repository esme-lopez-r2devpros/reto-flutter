import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reto_flutter/src/models/ComidaModel.dart';
import 'package:reto_flutter/src/providers/comidas_provider.dart';
import 'package:reto_flutter/src/widget/suggestions_widget.dart';

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

  final styleBody = TextStyle(fontSize: 16.0, color: Colors.grey[300]);

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
        toolbarHeight: 90.0,
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
      body: 
      SingleChildScrollView(
        child:
         Container(
         height: 1200.0,
         
        color: Colors.grey[800],
        child: Column(
            children: [
              _verImagen(),
              _verRating(),
              SizedBox(height: 50.0, child: _showTags(context, comida.tags)),               
              _showHour(),   
              _isNew(context, comida),
              _etiqueta(),              
                 Flexible( child: _createSuggestion(context, comida)) ,                                                                                     
           ],
         ),
       ),
       ),
    );
  }

  Widget _etiqueta(){
    return Container( width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 20.0), child: Text("Goes well with...", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[400], fontSize: 18.0, ), ));
  }

Widget _createSuggestion(BuildContext contextp , ComidaModel comidap){

 return  
SuggestionWidget(context: contextp, comida: comidap,);           
 //SuggestionWidget(context: contextp ,comida:comidap);
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
                      width: 10.0,
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

  List<Widget> _crearTag(BuildContext context, List<String> tags) {
    return tags.map((element) {
      return Container(
      child: 
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container( 
           // margin: EdgeInsets.symmetric(horizontal:2.0),           
            padding: EdgeInsets.all(14.0),
            color: Colors.blue[300],
            child:               
                Text(element, style: TextStyle(color: Colors.grey[300]),),                                        
          ),
        ),
      
    );
    }).toList();
    
  }

  Widget _showTags(BuildContext context, List<String> tags) {
   
    return Container(
      
          child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: 0.0,
        runSpacing: 5.0,              
        children: 
        _crearTag(context, tags),
        
        
        ),
    );

     /* return GridView.builder(
            itemCount: tags.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, i) => _crearTag(context, tags[i]),
          );*/
    
  }

  Widget _showHour() {
    final formatHourStar = DateFormat.jm().format(comida.dateStart);
    final formatHourEnd = DateFormat.jm().format(comida.dateEnd);    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(children: [
        Icon(Icons.access_time, color: Colors.grey[300], size: 30.0),
        SizedBox(
          width: 10.0,
        ),
        Column(
          children: [
            Text(
              '$formatHourStar - $formatHourEnd ',
              style: styleBody, textAlign: TextAlign.right,
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



  Widget _isNew(BuildContext context, ComidaModel comida) {
    return SwitchListTile(
      title: Text('New', style: styleBody),
      value: comida.comidaModelNew,
      activeColor: Colors.blue,
      onChanged: (value) => setState(() {}),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reto_flutter/src/models/ComidaModel.dart';
import 'package:reto_flutter/src/providers/comidas_provider.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  final comidasProvider=new ComidasProvider();
  ComidaModel comida=new ComidaModel();
  
  

  @override
  Widget build(BuildContext context) {
    ComidaModel comidaData= ModalRoute.of(context).settings.arguments;
    if(comidaData!=null){
      comida=comidaData;
    }
    return Scaffold(      
      appBar: AppBar(
        title: Text(comida.name, textAlign: TextAlign.center,
         style: TextStyle(fontSize: 20.0)),
        backgroundColor: Colors.grey[800],  
        toolbarHeight: 100.0,        
        leading: GestureDetector(child: Icon(Icons.chevron_left), onTap: () => Navigator.pop(context),),     
        actions: [
          IconButton(
            icon: Icon(Icons.local_dining),
            onPressed: (){},
          ),              
        ],
      ),
      body:       
       SingleChildScrollView(      
        child: Container(
          child: Column(            
            children: [              
              _verImagen(),
              _mostrarRating(),
              _mostrarDescripcion(),
              //_crearEtiquetas(),
              _mostrarHorario(),
              _mostrarSugerencias(),
              _mostrarNuevo(),
            ],
          ),
        ),
      ),
    );    
}


Widget _verImagen(){
  return FadeInImage(
    image: NetworkImage(comida.imageUrl),
    placeholder: AssetImage('assets/loading.gif'),
    fadeInDuration: Duration(seconds: 5),
  );
}
Widget _mostrarRating(){
  return Container();
}
Widget _mostrarDescripcion(){
  return Padding(
     padding: EdgeInsets.symmetric(horizontal:20.0),
    child: Container(     
      child: Text(comida.description),
    ),
  );
}


Widget _mostrarEtiquetas( String tag ){
  if(tag!=null)
  {
    return Container(
    margin: EdgeInsets.all(10.0) ,
 child:
     
      Text(tag),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
         color: Colors.blueAccent,
      ),
  );
  }      
}

Widget _crearEtiquetas(){  
  if(comida.tags!=null) {

      comida.tags.forEach((tag){
    return Container(
      child: _mostrarEtiquetas(tag)
    );
    });  
}
}

Widget _mostrarHorario(){
  return Container();
}
Widget _mostrarSugerencias(){
  return Container();
}
Widget _mostrarNuevo(){
  return Container();
}
}
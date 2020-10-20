import 'package:flutter/material.dart';
import 'package:reto_flutter/src/models/ComidaModel.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {

  ComidaModel comida= new ComidaModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: Text('Sourdough French Toast', textAlign: TextAlign.center,
         style: TextStyle(fontSize: 20.0)),
        backgroundColor: Colors.grey[800],  
        toolbarHeight: 100.0,        
        leading: Icon(Icons.chevron_left),     
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
              _mostrarEtiquetas(),
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
    image: AssetImage('assets/no-image.png'),
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
      child: Text('Our classic sourdough bread soaked in delicious vainilla batter and toasted to perfection. Butter, syrup and cinnamon included!'),
    ),
  );
}
Widget _mostrarEtiquetas(){
  return Container( 
    margin: EdgeInsets.all(10.0) ,
    child: Text('MAIN DISH'),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
       color: Colors.blueAccent,
    ),
  );
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
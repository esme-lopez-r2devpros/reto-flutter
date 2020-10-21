import 'package:flutter/material.dart';
import 'package:reto_flutter/src/models/ComidaModel.dart';
import 'package:reto_flutter/src/providers/comidas_provider.dart';

class HomePage extends StatelessWidget {
    final comidasProvider = new ComidasProvider();
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      
      body: _crearListadoComidas()                  
    );    
  }


  Widget _crearListadoComidas(){
    return FutureBuilder(
      future: comidasProvider.cargarComidas(),      
      builder: (BuildContext context, AsyncSnapshot<List<ComidaModel>> snapshot) {
        if(snapshot.hasData){
          return Container();
        }else{
          return Center( child: CircularProgressIndicator());
        }
        
      },
    );
    
  }


  Widget _crearComida(){
     return Container(
      child: Column(
        children: [
        Container(
          child: FadeInImage(
          image: AssetImage('assets/no-image.png'),
          height: 100.0,
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(seconds: 5),  
          fit: BoxFit.cover,      
          ),
        decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(50.0)
        ),
        ),        
        Text('Spagetti Sauce w/Met')
      ],
      ),      
    );
  }

}
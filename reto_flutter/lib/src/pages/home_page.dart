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
          final comidas= snapshot.data;
          return 
                ListView.builder(
              itemCount: comidas.length,
              itemBuilder: (context, i)=>_crearComida(context, comidas[i]),
            );
                        
        }else{
          return Center( child: CircularProgressIndicator());
        }
        
      },
    );
    
  }


  Widget _crearComida(BuildContext context, ComidaModel comida){
     return GestureDetector(
            child: Container(       
        child: Column(
          children: [
            (comida.imageUrl==null)
            ? Image(image: AssetImage('assets/no-image.png'))
            :
          Container(
            child: FadeInImage(
            image:NetworkImage(comida.imageUrl),
            height: 100.0,
            placeholder: AssetImage('assets/loading.gif'),
            fadeInDuration: Duration(seconds: 5),  
            fit: BoxFit.cover,      
            ),
          decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(50.0)
          ),
          ),        
          Text(comida.name)        
        ],      
        ),            
    ),
    onTap: ()=> Navigator.pushNamed(context, 'detalle', arguments: comida ),
     );
  }

}
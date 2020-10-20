import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _crearListadoComidas()                  
    );    
  }


  Widget _crearListadoComidas(){
    return SafeArea(
          child: Wrap(        
        direction: Axis.horizontal,
        children: [       
        _crearComida(),
        _crearComida(),
        _crearComida(),
        _crearComida(),      
        ],           
      ),
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
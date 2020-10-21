
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reto_flutter/src/models/ComidaModel.dart';

class ComidasProvider{
  final String _url='https://run.mocky.io/v2/5dc59f0d3200007200769c29';


  Future<List<ComidaModel>> cargarComidas() async{

      final resp= await http.get(_url);
      final List<ComidaModel> comidas=new List();
      final List<dynamic>  decodedData= json.decode(resp.body);

      //print(decodedData);
      if(decodedData==null) return [];

      decodedData.forEach( (comida){
          final comidaTemp= ComidaModel.fromJson(comida);
          comidas.add(comidaTemp);
      });
          
          
      return comidas;
      

  }


}
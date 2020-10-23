import 'package:flutter/material.dart';
import 'package:reto_flutter/src/models/ComidaModel.dart';

class SuggestionWidget extends StatelessWidget {
  final ComidaModel comida;
  final BuildContext context;

  SuggestionWidget({@required this.context ,@required this.comida});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: 2,
      children: _tarjeta(context, comida.suggestions)
      ),
    );
  }

  final List<Widget> sugerenciaIndividual = null;

  List<Widget> _tarjeta(BuildContext context, List<Suggestion> suggestionsp){
    
    return suggestionsp.map(( sugerencia ){

       return Column(
      children: [
        GestureDetector(
          child: Container(            
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                (sugerencia.imageUrl == null)
                    ? Image(image: AssetImage('assets/no-image.png'))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
                          image: NetworkImage(sugerencia.imageUrl),
                          placeholder: AssetImage('assets/loading.gif'),
                          fadeInDuration: Duration(seconds: 5),
                          fit: BoxFit.cover,
                        ),
                      ),
                Text(sugerencia.name,
                    style: TextStyle(fontSize: 15.0, color: Colors.grey[400]))
              ],
            ),
          ),
         onTap: () {}
              
        ),
      ],
    );

    }).toList();

  }
}

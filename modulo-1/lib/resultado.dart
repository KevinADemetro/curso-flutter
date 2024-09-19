

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{

  final int pontuacao;
  final void Function() onPressed;

  Resultado(this.pontuacao, this.onPressed);

  String get fraseResultado{
    if (pontuacao < 8) {
      return 'Tente novamente';
    }else if (pontuacao < 12){
      return 'Bom';
    }else {
      return 'Perfeito';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28
            ),
          ) ,
        ),
        TextButton(onPressed: onPressed, child: Text('Reiniciar'))
      ],
    );
  }
}
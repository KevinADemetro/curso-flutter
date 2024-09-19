import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{

  final String texto;
  final void Function() onSelection;

  const Resposta(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: onSelection,
        child: Text(texto),
      ),
    );
  }
}
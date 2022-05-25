import 'package:flutter/material.dart';

class ItenLayout extends StatelessWidget {
  final String status;

  //cria construtor para receber no stat
  ItenLayout({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(),
        color: Colors.indigo,
      ),
      child: Center(
        child: Text(
          status,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

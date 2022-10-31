import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(
    this.texto,
    this.onPressed, {
    Key? key,
  }) : super(key: key);

  final String texto;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}

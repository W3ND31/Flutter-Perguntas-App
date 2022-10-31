import 'package:flutter/material.dart';
import 'package:projeto_perguntas/components/questao.dart';
import 'package:projeto_perguntas/components/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;

  final int perguntaSelecionada;

  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    List<Widget> widgets = respostas.map((item) {
      String texto = item['texto'] as String;
      int pontuacao = int.parse(item['pontuacao'].toString());

      return Resposta(texto, () => responder(pontuacao));
    }).toList();

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets,
      ],
    );
  }
}

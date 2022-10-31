import 'package:flutter/material.dart';
import 'package:projeto_perguntas/components/questionario.dart';
import 'package:projeto_perguntas/components/resultado.dart';

class Perguntas extends StatefulWidget {
  const Perguntas({super.key});

  @override
  State<Perguntas> createState() => _PerguntasState();
}

class _PerguntasState extends State<Perguntas> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'pontuacao': 3, 'texto': 'Preto'},
        {'pontuacao': 2, 'texto': 'Vermelho'},
        {'pontuacao': 4, 'texto': 'Verde'},
        {'pontuacao': 1, 'texto': 'Branco'},
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'pontuacao': 2, 'texto': 'Coelho'},
        {'pontuacao': 1, 'texto': 'Cobra'},
        {'pontuacao': 3, 'texto': 'Cachorro'},
        {'pontuacao': 4, 'texto': 'Gato'},
      ]
    },
    {
      'texto': 'Qual seu filme favorito?',
      'respostas': [
        {'pontuacao': 4, 'texto': 'Interestellar'},
        {'pontuacao': 1, 'texto': 'Clube da Luta'},
        {'pontuacao': 2, 'texto': 'Gigante de Aço'},
        {'pontuacao': 3, 'texto': 'Vingadores: Ultimato'},
      ]
    },
    {
      'texto': 'Qual seu time do coração?',
      'respostas': [
        {'pontuacao': 1, 'texto': 'Paysandu'},
        {'pontuacao': 4, 'texto': 'São Paulo'},
        {'pontuacao': 3, 'texto': 'Vitória'},
        {'pontuacao': 2, 'texto': 'Bahia'},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });

      print(
          'Pergunta respondida, $_perguntaSelecionada - Nota até o momento: $_pontuacaoTotal');
    }
  }

  void _reinciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return temPerguntaSelecionada
        ? Questionario(
            perguntaSelecionada: _perguntaSelecionada,
            perguntas: _perguntas,
            responder: _responder,
          )
        : Resultado(_pontuacaoTotal, _reinciarQuestionario);
  }
}

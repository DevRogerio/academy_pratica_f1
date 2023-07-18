import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MeuWidget(),
        ),
      ),
    );
  }
}

enum EstadoDoJogo {
  emProgresso,
  ganhou,
  perdeu,
}

class MeuWidget extends StatefulWidget {
  @override
  State<MeuWidget> createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<MeuWidget> {
  final random = Random();

  var vitorias = 0;
  var derrotas = 0;
  var botaoCorreto = 0;
  var contadorCliques = 0;
  var estadoDoJogo = EstadoDoJogo.emProgresso;

  @override
  void initState() {
    super.initState();
    iniciarJogo();
  }

  void iniciarJogo() {
    botaoCorreto = random.nextInt(3);
    contadorCliques = 0;
    estadoDoJogo = EstadoDoJogo.emProgresso;
  }

  void aoClicarNoBotao(int botaoIndex) {
    if (estadoDoJogo != EstadoDoJogo.emProgresso) return;

    setState(() {
      if (botaoIndex == botaoCorreto) {
        estadoDoJogo = EstadoDoJogo.ganhou;
        vitorias++;
      } else {
        contadorCliques++;

        if (contadorCliques >= 2) {
          estadoDoJogo = EstadoDoJogo.perdeu;
          derrotas++;
        }
      }
    });
  }

  void reiniciarJogo() {
    setState(() {
      iniciarJogo();
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Vitórias: $vitorias'),
        Text('Derrotas: $derrotas'),
        if (estadoDoJogo == EstadoDoJogo.emProgresso)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MeuBotao('A', () => aoClicarNoBotao(0)),
              MeuBotao('B', () => aoClicarNoBotao(1)),
              MeuBotao('C', () => aoClicarNoBotao(2)),
            ],
          ),
        if (estadoDoJogo == EstadoDoJogo.ganhou)
          MensagemResultado('Você ganhou!', Colors.green, reiniciarJogo),
        if (estadoDoJogo == EstadoDoJogo.perdeu)
          MensagemResultado('Você perdeu!', Colors.red, reiniciarJogo),
      ],
    );
  }
}

class MeuBotao extends StatelessWidget {
  final String label;
  final VoidCallback aoClicar;

  MeuBotao(this.label, this.aoClicar);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: aoClicar,
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class MensagemResultado extends StatelessWidget {
  final String mensagem;
  final Color cor;
  final VoidCallback aoReiniciar;

  MensagemResultado(this.mensagem, this.cor, this.aoReiniciar);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mensagem,
          style: TextStyle(fontSize: 24, color: cor),
        ),
        ElevatedButton(
          onPressed: aoReiniciar,
          child: Text('Jogar novamente'),
        ),
      ],
    );
  }
}


  

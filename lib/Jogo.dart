import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("img/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  var _pontosBot = 0;
  var _pontosUser = 0;
  var _jogadas = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("img/pedra.png");
        });
        break;
      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("img/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("img/tesoura.png");
        });
        break;
    }

    if (
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Parabéns!!! Você Ganhou :)";
        _pontosUser += 1;
        _jogadas += 1;
      });
    } else if (
      (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
      (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "pedra" && escolhaApp == "papel")
    ) {
      setState(() {
        this._mensagem = "Você Perdeu :(";
        _pontosBot += 1;
        _jogadas += 1;
      });
    } else {
      setState(() {
        this._mensagem = "Empate!!!!";
        _jogadas += 1;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Po"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
              "Escolha do App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          ),
          Image(image: this._imagemApp),
          Padding(
              padding: EdgeInsets.only(top:15, bottom: 16),
              child: Text(
                this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset('img/pedra.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset('img/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset('img/tesoura.png', height: 100),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),)
          ),
          Column(
            children: [
              Text(_jogadas.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                ),),
              Text("Rodada",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 35),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(_pontosUser.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),),
                  Text("Player",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                ],
              ),
              Column(
                children: [
                  Text(_pontosBot.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                    ),),
                  Text("Bot",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

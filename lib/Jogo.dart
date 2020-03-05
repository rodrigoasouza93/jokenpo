import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  AssetImage _appImage = AssetImage("assets/images/padrao.png");
  AssetImage _userImage = AssetImage("assets/images/padrao.png");
  String _result = "Escolha uma opção abaixo";
  Color _resultColor = Colors.black;

  void _opcaoSelecionada(String userChoice) {
    List<String> options = ["pedra", "papel", "tesoura"];
    int index = Random().nextInt(options.length);
    String appChoice = options[index];

    setState(() {
      _appImage = AssetImage("assets/images/$appChoice.png");
      _userImage = AssetImage("assets/images/$userChoice.png");
    });

    _defineWinner(userChoice, appChoice);
  }

  void _defineWinner(String userChoice, String appChoice) {
    if ((userChoice == "pedra" && appChoice == "tesoura") ||
        (userChoice == "tesoura" && appChoice == "papel") ||
        (userChoice == "papel" && appChoice == "pedra")) {
      setState(() {
        _result = "Parabéns!!! Você ganhou :)";
        _resultColor = Colors.green;
      });
    } else if ((userChoice == "tesoura" && appChoice == "pedra") ||
        (userChoice == "pedra" && appChoice == "papel") ||
        (userChoice == "papel" && appChoice == "tesoura")) {
      setState(() {
        _result = "Você perdeu :(";
        _resultColor = Colors.red;
      });
    } else {
      setState(() {
        _result = "Houve um empate :|";
        _resultColor = Colors.black;
      });
    }
  }

  void _reset() {
    setState(() {
      _appImage = AssetImage("assets/images/padrao.png");
      _userImage = AssetImage("assets/images/padrao.png");
      _result = "Escolha uma opção abaixo";
      _resultColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _appImage,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do Usuário",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _userImage,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _resultColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  "assets/images/pedra.png",
                  height: 100,
                ),
                onTap: () => _opcaoSelecionada("pedra"),
              ),
              GestureDetector(
                child: Image.asset(
                  "assets/images/papel.png",
                  height: 100,
                ),
                onTap: () => _opcaoSelecionada("papel"),
              ),
              GestureDetector(
                child: Image.asset(
                  "assets/images/tesoura.png",
                  height: 100,
                ),
                onTap: () => _opcaoSelecionada("tesoura"),
              ),
            ],
          ),
          GestureDetector(
            child: Icon(
              Icons.replay,
              size: 50,
            ),
            onTap: _reset,
          )
        ],
      ),
    );
  }
}

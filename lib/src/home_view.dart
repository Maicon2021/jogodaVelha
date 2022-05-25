import 'package:flutter/material.dart';
import 'package:jogodavelha/src/iten_layout.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<int> _tabuleiro = List.generate(9, (_) => 0);

  int jogadorX = 0;
  int jogadorO = 0;
  int _jogadorVez = 1;
  final int _jogadas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Joga da Velha'),
      ),
      //corpo da tela
      body: Container(
        padding: const EdgeInsets.all(10),
        child: _criaCorpo(),
      ),
    );
  }

  Widget _criaCorpo() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Jogador X: $jogadorX',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  'Jogador O: $jogadorO',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ItenLayout(status: _returnStatus(index)),
                  onTap: () {
                    if (_validaJogada(index) == true) {
                      if (_validaGanhador() == 0) {
                        _jogar(index);
                      }
                    }                    
                  },
                );
              },
            ),
          ),
          SizedBox(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: RaisedButton(
                color: Colors.indigo,
                textColor: Colors.white,
                onPressed: _resetJogo,
                child: const Text('Reset'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _returnStatus(int index) {
    var valorPosicao = _tabuleiro[index];
    if (valorPosicao == 1) {
      return 'X';
    }
    if (valorPosicao == 2) {
      return 'O';
    }
    return ' ';
  }

  bool _validaJogada(int index) {
    return _tabuleiro[index] == 0;
  }

  void _jogar(int index) {
    setState(() {
      _tabuleiro[index] = _jogadorVez;
      _jogadorVez = _jogadorVez % 2 == 0 ? 1 : 2;
    });
  }

  int _validaGanhador() {
    if (((_tabuleiro[0] == 1) &&
            (_tabuleiro[1] == 1) &&
            (_tabuleiro[2] == 1)) ||
        (((_tabuleiro[0] == 1) &&
            (_tabuleiro[4] == 1) &&
            (_tabuleiro[8] == 1))) ||
        (((_tabuleiro[3] == 1) &&
            (_tabuleiro[4] == 1) &&
            (_tabuleiro[5] == 1))) ||
        (((_tabuleiro[6] == 1) &&
            (_tabuleiro[7] == 1) &&
            (_tabuleiro[8] == 1))) ||
        (((_tabuleiro[6] == 1) &&
            (_tabuleiro[4] == 1) &&
            (_tabuleiro[2] == 1))) ||
        (((_tabuleiro[0] == 1) &&
            (_tabuleiro[3] == 1) &&
            (_tabuleiro[6] == 1))) ||
        (((_tabuleiro[1] == 1) &&
            (_tabuleiro[4] == 1) &&
            (_tabuleiro[7] == 1))) ||
        (((_tabuleiro[2] == 1) &&
            (_tabuleiro[5] == 1) &&
            (_tabuleiro[8] == 1)))) {
      jogadorX++;
      _limpaTabuleiro();
      return 1;
    }
    if (((_tabuleiro[0] == 2) &&
            (_tabuleiro[1] == 2) &&
            (_tabuleiro[2] == 2)) ||
        (((_tabuleiro[0] == 2) &&
            (_tabuleiro[4] == 2) &&
            (_tabuleiro[8] == 2))) ||
        (((_tabuleiro[3] == 2) &&
            (_tabuleiro[4] == 2) &&
            (_tabuleiro[5] == 2))) ||
        (((_tabuleiro[6] == 2) &&
            (_tabuleiro[7] == 2) &&
            (_tabuleiro[8] == 2))) ||
        (((_tabuleiro[0] == 2) &&
            (_tabuleiro[3] == 2) &&
            (_tabuleiro[6] == 2))) ||
        (((_tabuleiro[6] == 2) &&
            (_tabuleiro[4] == 2) &&
            (_tabuleiro[2] == 2))) ||
        (((_tabuleiro[1] == 2) &&
            (_tabuleiro[4] == 2) &&
            (_tabuleiro[7] == 2))) ||
        (((_tabuleiro[2] == 2) &&
            (_tabuleiro[5] == 2) &&
            (_tabuleiro[8] == 2)))) {
      jogadorO++;
      _limpaTabuleiro();
      return 2;
    }
    return 0;
  }

  _limpaTabuleiro() {
    setState(() {
      for (var i = 0; i <= 8; i++) {
        _tabuleiro[i] = 0;
      }
    });
  }

  _resetJogo() {
    _limpaTabuleiro();
    jogadorO = 0;
    jogadorX = 0;
  }
}

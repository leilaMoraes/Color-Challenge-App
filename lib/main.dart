import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio das Cores',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Desafio das Cores'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyColorItem {
  final String word;
  final Color color;

  MyColorItem(this.word, this.color);
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedButton = 0;
  bool showColors = false;
  bool showWarming = false;
  bool showButton = false;
  int index = 0;
  List<MyColorItem> colorsList = [];
  List<MyColorItem> colorsEasy = [
    MyColorItem('azul', Colors.red),
    MyColorItem('rosa', Colors.blue),
    MyColorItem('vermelho', Colors.yellow),
    MyColorItem('marrom', Colors.green),
    MyColorItem('roxo', Colors.yellow),
    MyColorItem('amarelo', Colors.green),
    MyColorItem('preto', Colors.red),
    MyColorItem('laranja', Colors.blue),
  ];
  List<MyColorItem> colorsMedium = [
    MyColorItem('azul', Colors.red),
    MyColorItem('rosa', Colors.blue),
    MyColorItem('vermelho', Colors.yellow),
    MyColorItem('marrom', Colors.green),
    MyColorItem('roxo', Colors.grey),
    MyColorItem('amarelo', Colors.purple),
    MyColorItem('preto', Colors.brown),
    MyColorItem('branco', Colors.orange),
    MyColorItem('verde', Colors.red),
    MyColorItem('cinza', Colors.blue),
    MyColorItem('laranja', Colors.green),
    MyColorItem('rosa', Colors.yellow),
    MyColorItem('preto', Colors.grey),
    MyColorItem('verde', Colors.purple),
    MyColorItem('vermelho', Colors.brown),
    MyColorItem('cinza', Colors.orange),
  ];

  List<MyColorItem> colorsHard = [
    MyColorItem('azul', Colors.red),
    MyColorItem('rosa', Colors.blue),
    MyColorItem('vermelho', Colors.yellow),
    MyColorItem('marrom', Colors.green),
    MyColorItem('roxo', Colors.grey),
    MyColorItem('amarelo', Colors.purple),
    MyColorItem('preto', Colors.brown),
    MyColorItem('branco', Colors.orange),
    MyColorItem('verde', Colors.black),
    MyColorItem('cinza', Colors.white),
    MyColorItem('laranja', Colors.pink),
    MyColorItem('rosa', Colors.red),
    MyColorItem('preto', Colors.blue),
    MyColorItem('verde', Colors.yellow),
    MyColorItem('vermelho', Colors.green),
    MyColorItem('marrom', Colors.grey),
    MyColorItem('roxo', Colors.brown),
    MyColorItem('amarelo', Colors.purple),
    MyColorItem('laranja', Colors.black),
    MyColorItem('branco', Colors.orange),
    MyColorItem('cinza', Colors.pink),
    MyColorItem('marrom', Colors.white),
  ];

  late Timer _timer;

  void startTimer() {
    const duration = Duration(seconds: 2);
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (index < colorsList.length - 1) {
          index++;
        } else {
          timer.cancel();
          showColors = false;
          showButton = false;
          index = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                    Colors.blue,
                    Colors.indigo,
                    Colors.purple,
                  ],
                ).createShader(Rect.fromLTWH(50.0, 0.0, 300.0, 0.0))),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Stack(
            children: [
              Text(
                'Escolha um nível',
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Color.fromARGB(220, 240, 63, 122),
                ),
              ),
              Text(
                'Escolha um nível',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 20.0,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: selectedButton == 1
                        ? Colors.grey[900]
                        : Colors.grey[300],
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    )),
                onPressed: () {
                  setState(() {
                    showWarming = false;
                    selectedButton == 1
                        ? selectedButton = 0
                        : selectedButton = 1;
                    if (selectedButton == 1) {
                      colorsList = colorsEasy;
                    } else {
                      colorsList = [];
                    }
                  });
                },
                child: const Text(
                  'Fácil',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: selectedButton == 2
                        ? Colors.grey[900]
                        : Colors.grey[300],
                    side: const BorderSide(
                      color: Color.fromARGB(255, 249, 168, 37),
                      width: 2,
                    )),
                onPressed: () {
                  setState(() {
                    showWarming = false;
                    selectedButton == 2
                        ? selectedButton = 0
                        : selectedButton = 2;
                    if (selectedButton == 2) {
                      colorsList = colorsMedium;
                    } else {
                      colorsList = [];
                    }
                  });
                },
                child: Text(
                  'Médio',
                  style: TextStyle(
                    color: Colors.yellow[800],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: selectedButton == 3
                        ? Colors.grey[900]
                        : Colors.grey[300],
                    side: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    )),
                onPressed: () {
                  setState(() {
                    showWarming = false;
                    selectedButton == 3
                        ? selectedButton = 0
                        : selectedButton = 3;
                    if (selectedButton == 3) {
                      colorsList = colorsHard;
                    } else {
                      colorsList = [];
                    }
                  });
                },
                child: const Text(
                  'Difícil',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const ExpansionTile(
            title: Text(
              'Regra do jogo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.deepOrangeAccent),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Leia a cor que aparece na tela e não a que está escrita.',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[50],
            ),
            onPressed: () {
              if (selectedButton == 0) {
                setState(() {
                  showWarming = !showWarming;
                });
              } else {
                setState(() {
                  showColors = !showColors;
                  showButton = true;
                  startTimer();
                });
              }
            },
            child: const Text(
              'JOGAR',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          if (showColors)
            Expanded(
              child: Text(
                colorsList[index].word,
                style: TextStyle(
                    color: colorsList[index].color, fontSize: 70, height: 6.0),
              ),
            ),
          if (showButton)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[50],
              ),
              onPressed: () {
                setState(() {
                  showColors = false;
                  showButton = false;
                  index = 0;
                  _timer.cancel();
                });
              },
              child: const Text(
                'PARAR',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (showWarming)
            const Text(
              'Selecione um nível',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  int selectedButton = 0;

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
            children: <Widget>[
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
                    selectedButton == 1
                        ? selectedButton = 0
                        : selectedButton = 1;
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
                    selectedButton == 2
                        ? selectedButton = 0
                        : selectedButton = 2;
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
                    selectedButton == 3
                        ? selectedButton = 0
                        : selectedButton = 3;
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
            onPressed: () {},
            child: const Text(
              'JOGAR',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

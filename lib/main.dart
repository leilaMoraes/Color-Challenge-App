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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.title),
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
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 30.0,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Fácil',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Médio',
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 188, 28), fontSize: 20),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Difícil',
                  style: TextStyle(color: Colors.red, fontSize: 20),
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
                  color: Color.fromARGB(255, 233, 145, 14)),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Leia a cor que aparece na tela e não a que está escrita.',
                  style: TextStyle(fontSize: 18),
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

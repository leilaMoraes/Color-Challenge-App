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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Escolha um nível',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Wrap(
            spacing: 30.0,
            children: [
              OutlinedButton(
                onPressed: null,
                child: Text('Fácil'),
              ),
              OutlinedButton(
                onPressed: null,
                child: Text('Médio'),
              ),
              OutlinedButton(
                onPressed: null,
                child: Text('Difícil'),
              )
            ],
          ),
          const ExpansionTile(
            title: Text('Regra do jogo'),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Leia a cor que aparece e não a que está escrita'),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: null,
            child: Text(
              'JOGAR',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

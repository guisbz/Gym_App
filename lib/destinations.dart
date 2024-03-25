import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page'),
      ),
      body: Container(
        color: Colors.white, // Defina a cor de fundo como branco
      ),
    );
  }
}

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.whatshot_rounded, 'Exercícios'),
  Destination(Icons.account_circle_rounded, 'Perfil'),
  Destination(Icons.tune, 'Configurações'),
];

class DestinationWidget extends StatelessWidget {
  final Destination destination;

  const DestinationWidget({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar para a página em branco quando um destino for tocado
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BlankPage()),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(destination.icon),
          Text(destination.label),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: destinations
              .map((destination) => DestinationWidget(destination: destination))
              .toList(),
        ),
      ),
    ),
  ));
}

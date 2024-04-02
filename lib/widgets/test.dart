import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExerciseState(),
      child: MainApp(),
    ),
  );
}

class ExerciseState extends ChangeNotifier {
  int exercisesCompleted = 0;
  int totalExercises = 10;

  void incrementExercises() {
    if (exercisesCompleted < totalExercises) {
      exercisesCompleted++;
      notifyListeners(); // Notifica os ouvintes (widgets) sobre a mudança no estado
    }
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.amber),
      home: Feed(),
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ExerciseCard(
              imagePath: 'assets/gym1.jpg',
              title: 'Supino',
            ),
            SizedBox(height: 10),
            ExerciseCard(
              imagePath: 'assets/gym2.jpg',
              title: 'Título do Card',
              description: 'Descrição do Card',
            ),
            SizedBox(height: 10),
            ExerciseCard(
              imagePath: 'assets/gym4.jpg',
              title: 'Título do Card',
              description: 'Descrição do Card',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot_rounded), label: 'Exercícios'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Perfil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.tune), label: 'Configurações')
        ],
        onTap: (int index) {
          // O gerenciamento de estado aqui foi removido para evitar a reconstrução da tela
          // e a perda de dados ao navegar entre as telas
        },
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? description;

  const ExerciseCard({super.key, 
    required this.imagePath,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(
        child: SizedBox(
          width: 500,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (description != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          description!,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 50),
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<ExerciseState>(context, listen: false)
                                  .incrementExercises();
                            },
                            child: const Text('+'),
                          ),
                          Consumer<ExerciseState>(
                            builder: (context, exerciseState, child) {
                              return Text(
                                '${exerciseState.exercisesCompleted}/${exerciseState.totalExercises}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

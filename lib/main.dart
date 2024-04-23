import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'ui/login.dart';
import 'ui/signup.dart';

//Inicio

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xlrqxbcellxfirdnpxwc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhscnF4YmNlbGx4ZmlyZG5weHdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM5MDQ4NjMsImV4cCI6MjAyOTQ4MDg2M30.UAtgxBifsXySwfmUuxY1szH2eHJ80IJ8uU3Fxnu_laI',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpPage(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Sign Out User
  Future<void> signOut() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  final noteStream = supabase.from('notes').stream(primaryKey: ['id']);

  //Create Note
  Future<void> createNote(String note) async {
    await supabase.from('notes').insert({'body': note});
  }

  // Update Note
  Future<void> updateNote(String noteId, String updatedNote) async {
    await supabase.from('notes').update({'body': updatedNote}).eq('id', noteId);
  }

  // Delete Note
  Future<void> deleteNote(String noteId) async {
    await supabase.from('notes').delete().eq('id', noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout_outlined),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
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
                          'assets/gym1.jpg',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  'Supino',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 35),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // feedState.incrementExercises();
                                      // print(
                                      //     'exercisesCompleted: ${feedState.exercisesCompleted}');
                                    },
                                    child: const Text('+'),
                                  ),
                                  // Text(
                                  //   '${feedState.exercisesCompleted}/${feedState.totalExercises}',
                                  //   style: const TextStyle(
                                  //     fontSize: 16,
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    width: 50,
                                  )
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
            ),
            const SizedBox(height: 10),
            SizedBox(
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
                          'assets/gym2.jpg',
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Título do Card',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Descrição do Card',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
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
                          'assets/gym4.jpg',
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Título do Card',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Descrição do Card',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          switch (index) {
            case 0:
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const Feed()),
              // );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlankPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlankPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
//Fim

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page'),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}

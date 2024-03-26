import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'models/data.dart' as data;
import 'models/models.dart';



class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page'),
      ),
      body: Container(
        color: Colors.white, 
      ),
    );
  }
}  

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.amber ),
      home: Feed(),
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({
    super.key,
  });


  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);
  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1250),
      value: 0,
      vsync: this);

  int selectedIndex = 0;
  bool controllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    final AnimationStatus status = _controller.status;
    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 425,
                enableInfiniteScroll: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
              ),
              items: [
                'assets/gym1.jpg',
                'assets/gym2.jpg',
              ].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Center(
                child: SizedBox(
                  width: 300,
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
                                  fontFamily: null

                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Descrição do Card',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: null

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
              height: 300,
              child: Center(
                child: SizedBox(
                  width: 300,
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
                                  fontFamily: null

                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Descrição do Card',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: null

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
              height: 300,
              child: Center(
                child: SizedBox(
                  width: 300,
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
            items: const [BottomNavigationBarItem(icon: Icon(Icons.whatshot_rounded), label: 'Exercícios'), BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: 'Perfil'), BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Configurações')],
            onTap: (int index) {
  switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Feed()),
              );
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

import 'models.dart';

final User user_0 = User(
    name: const Name(first: 'Me', last: ''),
    avatarUrl: 'assets/avatar_1.png',
    lastActive: DateTime.now());
final User user_1 = User(
    name: const Name(first: '老', last: '强'),
    avatarUrl: 'assets/avatar_2.png',
    lastActive: DateTime.now().subtract(const Duration(minutes: 10)));
final User user_2 = User(
    name: const Name(first: 'Guilherme', last: 'Barboza'),
    avatarUrl: 'assets/avatar_3.png',
    lastActive: DateTime.now().subtract(const Duration(minutes: 20)));
final User user_3 = User(
    name: const Name(first: 'Waldemario', last: 'MacDonald'),
    avatarUrl: 'assets/avatar_4.png',
    lastActive: DateTime.now().subtract(const Duration(hours: 2)));
final User user_4 = User(
    name: const Name(first: 'Ziad', last: 'Aouad'),
    avatarUrl: 'assets/avatar_5.png',
    lastActive: DateTime.now().subtract(const Duration(hours: 6)));

final List<Exercicios> emails = [
   const Exercicios(
    content: 'assets/gym2.jpg',

  ),
   const Exercicios(
    content: 'assets/gym2.jpg',

  ),
   const Exercicios(
    content: 'assets/gym2.jpg',

  ),

];

final List<Exercicios> replies = [
   const Exercicios(
    content: 'assets/gym2.jpg',

  ),
   const Exercicios(
    content: 'assets/gym2.jpg',

  ),
];
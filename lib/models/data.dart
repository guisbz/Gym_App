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
    subject: '豆花鱼',
    content: '最近忙吗？昨晚我去了你最爱的那家饭馆，点了他们的特色豆花鱼，吃着吃着就想你了。',
      attachments: [Attachment(url: 'gym3.jpg')],

  ),
  const Exercicios(
    subject: 'Malhei hsadaoje',
    content:
        "Malhei pacaraio lek",
      attachments: [Attachment(url: 'gym4.jpg')],

  ),
  const Exercicios(
      subject: 'Olha que pesos lindos',
      content:
          "Olha que pesos foda mano",
      attachments: [Attachment(url: 'assets/thumbnail_2.jpg')]),

];

final List<Exercicios> replies = [
  Exercicios(

    subject: 'Clube da Luta',
    content:
        "Chegou a hora de nós aumentar na rosca!! \n\n Oque acha?!\n\n",
  ),
  Exercicios(

    subject: 'Clube da Luta',
    content:
        "Não consigo aumentar mais na rosca... \n\n Alguma dica ?\n\n",
  ),
];
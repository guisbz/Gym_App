

class Attachment {
  const Attachment({
    required this.url,
  });

  final String url;
}

class Exercicios {
  const Exercicios({
    required this.content,
    this.replies = 0,
    this.attachments = const [],
  });

  final String content;
  final List<Attachment> attachments;
  final double replies;


}

class Name {
  const Name({
    required this.first,
    required this.last,
  });

  final String first;
  final String last;
  String get fullName => '$first $last';
}

class User {
  const User({
    required this.name,
    required this.avatarUrl,
    required this.lastActive,
  });

  final Name name;
  final String avatarUrl;
  final DateTime lastActive;
}
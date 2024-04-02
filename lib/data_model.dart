class UserData {
  final String name;

  UserData(this.name);

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}

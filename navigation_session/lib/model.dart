class Phones {
  String name;
  String subtitle;
  Phones({required this.name, required this.subtitle});
}

final List<Phones> phones = [
  Phones(name: 'Mom', subtitle: 'Missed Call'),
  Phones(name: 'Dad', subtitle: 'Missed Call'),
  Phones(name: 'Sister', subtitle: 'Missed Call'),
];

class Chats {
  String text;
  String subtext;
  Chats({required this.text, required this.subtext});
}

final List<Chats> chat =[
Chats(text: "Flutter Devs Group", subtext: "Last Message preview..."),
Chats(text: "Project Team", subtext: "Last Message preview..."),
Chats(text: "Depi Round 5", subtext: "Last Message preview...")
];

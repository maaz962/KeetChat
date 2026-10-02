class UserModel {
  final String id;
  final String name;
  final bool isOnline;

  const UserModel({
    required this.id,
    required this.name,
    this.isOnline = false,
  });

  // Naam ka pehla harf, avatar mein dikhane ke liye
  String get initial => name.isEmpty ? '?' : name[0].toUpperCase();
}
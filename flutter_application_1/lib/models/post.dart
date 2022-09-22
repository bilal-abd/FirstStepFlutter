class Post {
  String name;
  int id;
  String email;
  String phone;

  Post({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
  });
  Post.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        email = json['email'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'email': email,
        'phone': phone,
      };
}

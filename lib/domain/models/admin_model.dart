class AdminModel {
  String? id;
  String? name;
  String? email;
  String password = '';

  AdminModel({
    this.id,
    this.name,
    this.email,
    this.password = '',
  });

  AdminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}

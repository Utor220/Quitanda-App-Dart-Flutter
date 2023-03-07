class UserModel {
  String? nome;
  String? email;
  String? celular;
  String? cpf;
  String? senha;
  String? id;
  String? token;

  UserModel({
    this.nome,
    this.email,
    this.celular,
    this.cpf,
    this.senha,
    this.id,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'],
      email: map['email'],
      id: map['id'],
      nome: map['fullname'],
      senha: map['password'],
      celular: map['phone'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'email': email,
      'id': id,
      'fullname': nome,
      'password': senha,
      'phone': celular,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'name: $nome | cpf: $cpf';
  }
}

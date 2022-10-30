class User {
  int id = 0;
  String nome = "";
  String cpf = "";
  String telefone = "";
  String senha = "";

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    telefone = json['telefone'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['telefone'] = this.telefone;
    data['senha'] = this.senha;
    return data;
  }
}

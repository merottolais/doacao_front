class Donation {
  int id = 0;
  String descricao = "";
  String unidade = "";
  bool doado = false;
  int idDoador = 0;

  Donation();

  Donation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    unidade = json['unidade'];
    doado = json['doado'];
    idDoador = json['idDoador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['unidade'] = this.unidade;
    data['doado'] = this.doado;
    data['idDoador'] = this.idDoador;
    return data;
  }
}

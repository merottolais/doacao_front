class Conf {
  int id = 0;
  String ip = "";
  String porta = "";
  String token = "";
  int usuarioID = 0;

  Conf();

  Conf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ip = json['ip'];
    porta = json['porta'];
    token = json['token'];
    usuarioID = json['usuarioID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ip'] = this.ip;
    data['porta'] = this.porta;
    data['token'] = this.token;
    data['usuarioID'] = this.usuarioID;
    return data;
  }
}

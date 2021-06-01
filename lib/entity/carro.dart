class Carro {
  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;

  Carro({
    this.id,
    this.nome, 
    this.tipo, 
    this.descricao, 
    this.urlFoto, 
    this.urlVideo, 
    this.latitude, 
    this.longitude
  });

  Carro.fromJson(Map<String, dynamic> mapJson) {
    id = mapJson['id'];
    nome = mapJson['nome'];
    tipo = mapJson['tipo'];
    descricao = mapJson['descricao'];
    urlFoto = mapJson['urlFoto'];
    urlVideo = mapJson['urlVideo'];
    latitude = mapJson['latitude'];
    longitude = mapJson['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto;
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;

    return data;
  }
}
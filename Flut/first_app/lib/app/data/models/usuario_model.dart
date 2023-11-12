class UsuarioModel {
  final String cod_usuario;
  final String nome;
  final String senhahash;
  final String Nivel;

  UsuarioModel(
      {
      required this.cod_usuario,
      required this.nome,
      required this.senhahash,
      required this.Nivel,
  });

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      cod_usuario: map['cod_usuario'], 
      nome: map['nome'], 
      senhahash: map['senhahash'], 
      Nivel: map['Nivel'],
      );
    }
}

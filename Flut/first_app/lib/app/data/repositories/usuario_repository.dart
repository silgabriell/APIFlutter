import 'dart:convert';

import 'package:first_app/app/data/http/http_client.dart';
import 'package:first_app/app/data/models/usuario_model.dart';

import 'package:flutter_launcher_icons/custom_exceptions.dart';

abstract class IUsuarioRepository {
  Future<List<UsuarioModel>> getUsuarios();
}

class UsuarioRepository implements IUsuarioRepository {

  final IHttpClient client;

  UsuarioRepository({required this.client}); 

  @override
  Future<List<UsuarioModel>> getUsuarios() async {
    final response = await client.get(
      url: 'http://192.168.15.100:8080/usuarios',
    );

    if (response.statusCode == 200) {
      final List<UsuarioModel> usuarios = [];

      final body = jsonDecode(response.body);

      body['usuarios'].map((item) {
        final UsuarioModel usuario = UsuarioModel.fromMap(item);
        usuarios.add(usuario);
      }).toList();

      return usuarios;
    } else if (response.statusCode == 404) {
    throw FileNotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os usuários');
    }
  }

}

import 'package:first_app/app/data/http/exceptions.dart';
import 'package:first_app/app/data/models/usuario_model.dart';
import 'package:first_app/app/data/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';

class UsuarioStore {
   final IUsuarioRepository repository;


   final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

   final ValueNotifier<List<UsuarioModel>> state = 
        ValueNotifier<List<UsuarioModel>>([]);

        final ValueNotifier<String> erro = ValueNotifier<String>('');

  UsuarioStore({required this.repository});

        Future getUsuarios() async {
          isLoading.value = true;

          try {
            final result = await repository.getUsuarios();
            state.value = result;
          } on NotFoundException catch (e) {
            erro.value = e.message;
          }
          catch (e) {
            erro.value = e.toString();
          }

          isLoading.value = false;
        }

}
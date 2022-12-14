import 'dart:convert';

import 'package:gerenciador_gastos_pessoais/models/transacao.dart';
import 'package:gerenciador_gastos_pessoais/utils/rest_util.dart';
import 'package:http/http.dart';

class TransacaoRestService {
  Future<void> addTransacao(Transacao transacao) async {
    final response = await RestUtil.addData('transacaos', transacao.toJson());
  }

  Future<List<Transacao>> getTransacoes() async {
    final response = await RestUtil.getData('transacaos');
    if (response.statusCode == 200) {
      List<dynamic> conteudo = jsonDecode(response.body);
      List<Transacao> transacoes = conteudo
          .map((dynamic transacao) => Transacao.fromJson(transacao))
          .toList();
      return transacoes;
    } else {
      throw Exception("Erro ao listar transações");
    }
  }

  Future<Transacao> getTransacaoId(String id) async {
    final response = await RestUtil.getDataId('transacaos', id);
    if (response.statusCode == 200) {
      return Transacao.fromJson(json.decode(response.body));
    } else {
      throw Exception("Erro ao buscar a transação");
    }
  }

  Future<void> editTransacao(Transacao transacao, String id) async {
    final novaTransacao = {
      'titulo': transacao.titulo,
      'descricao': transacao.descricao,
      'valor': transacao.valor,
      'data': transacao.data,
      'conta_id': transacao.conta,
      'tipo': transacao.tipo == "TipoEnum.entrada" ? "1" : "2"
    };
    final response = await RestUtil.editData('transacaos', novaTransacao, id);
    if (response.statusCode == 200) {
      print("transacao editada");
    } else {
      throw Exception("Erro ao editar a transação");
    }
  }

  Future<void> removeTransacao(String id) async {
    final response = await RestUtil.removeDataId('transacaos', id);
    if (response.statusCode == 204) {
      print("Transacao removida com sucesso");
    } else {
      throw Exception("Erro ao remover a transação");
    }
  }
}

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gerenciador_gastos_pessoais/models/transacao.dart';
import 'package:gerenciador_gastos_pessoais/screens/editar_transacao/editar_transacao_screen.dart';
import 'package:gerenciador_gastos_pessoais/services/transacao_rest_service.dart';

Widget cardTransacao(BuildContext context, int index, Transacao transacao) {
  TransacaoRestService trs = TransacaoRestService();

  Future<void> _removerTransacao(String id) async {
    return await trs.removeTransacao(id);
  }

  return Container(
    margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
    height: 68,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
            color: Color(0x0400000),
            blurRadius: 10,
            spreadRadius: 10,
            offset: Offset(0.0, 8.0)),
      ],
      color: Colors.white,
    ),
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          caption: 'Editar',
          color: Colors.blueAccent,
          icon: Icons.edit,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => EditarTransacaoScreen(
                    idTransacao: transacao.id.toString())));
          },
        ),
        IconSlideAction(
          caption: 'Remover',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            _removerTransacao(transacao.id.toString());
          },
        )
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    transacao.titulo!,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: transacao.tipo == "TipoEnum.entrada"
                            ? Colors.green
                            : Colors.red),
                  ),
                  Text(
                    transacao.descricao!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "R\$ " + transacao.valor.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                  Text(
                    formatDate(DateTime.parse(transacao.data!),
                        [dd, '/', mm, '/', yyyy]).toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

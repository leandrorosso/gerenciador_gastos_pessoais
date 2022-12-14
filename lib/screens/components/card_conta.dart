import 'package:flutter/material.dart';
import 'package:gerenciador_gastos_pessoais/models/conta.dart';
import 'package:gerenciador_gastos_pessoais/screens/conta/conta_screen.dart';
import 'package:gerenciador_gastos_pessoais/services/conta_rest_service.dart';

Widget cardConta(BuildContext context, Conta conta) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ContaScreen(
                id: conta.id,
              )));
    },
    onLongPress: () {
      showAlertDialog(context, conta);
    },
    child: Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
                color: Color(0x100000),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(0.0, 8.0))
          ]),
      child: Stack(
        children: [
          Positioned(
            top: 14,
            right: 12,
            child: Text(
              conta.titulo!,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 63,
            left: 16,
            child: Text(
              'Saldo em conta',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 81,
            left: 16,
            child: Text('R\$ ' + conta.saldo.toString(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white)),
          )
        ],
      ),
    ),
  );
}

showAlertDialog(BuildContext context, Conta conta) {
  ContaRestService crs = ContaRestService();
  Widget removerBotao = TextButton(
      onPressed: () {
        crs.removeConta(conta.id.toString());
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Text("Remover"));
  Widget cancelarBotao = TextButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Text("Cancelar"));

  AlertDialog alerta = AlertDialog(
    title: Text("Deseja remover a conta?"),
    content: Text("Esta a????o n??o pode ser desfeita"),
    actions: [removerBotao, cancelarBotao],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      });
}

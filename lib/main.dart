import 'package:flutter/material.dart';
import 'package:gerenciador_gastos_pessoais/screens/cadastrar_conta/cadastrar_conta_screen.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: CadastrarTransacaoScreen(tipoTransacao: 1,),
        home: CadastrarContaScreen());
  }
}

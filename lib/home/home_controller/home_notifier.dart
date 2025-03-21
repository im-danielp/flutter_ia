import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
  String get respostaIA => _respostaIA;
  String _respostaIA = '';

  // Armazena a resposta da IA no atribuito "_respostaIA".
  void armazenaResposta(String text) {
    _respostaIA = text;
    notifyListeners();
  }
}

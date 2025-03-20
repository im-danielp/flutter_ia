import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
  String get respostaIA => _respostaIA;
  String _respostaIA = '';

  void armazenaResposta(String text) {
    _respostaIA = text;

    notifyListeners();
  }
}
